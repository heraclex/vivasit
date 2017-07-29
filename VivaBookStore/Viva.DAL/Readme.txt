Entity Framework Code First to a New Database
https://msdn.microsoft.com/en-us/library/jj193542(v=vs.113).aspx


5. Dealing with Model Changes
Now it’s time to make some changes to our model, when we make these changes we also need to update the database schema. To do this we are going to use a feature called Code First Migrations, or Migrations for short.
Migrations allows us to have an ordered set of steps that describe how to upgrade (and downgrade) our database schema. Each of these steps, known as a migration, contains some code that describes the changes to be applied.
The first step is to enable Code First Migrations for our BloggingContext.
Tools -> Library Package Manager -> Package Manager Console
Run the Enable-Migrations command in Package Manager Console

A new Migrations folder has been added to our project that contains two items:
Configuration.cs – This file contains the settings that Migrations will use for migrating BloggingContext. We don’t need to change anything for this walkthrough, but here is where you can specify seed data, register providers for other databases, changes the namespace that migrations are generated in etc.


<timestamp>_InitialCreate.cs – This is your first migration, it represents the changes that have already been applied to the database to take it from being an empty database to one that includes the Blogs and Posts tables. Although we let Code First automatically create these tables for us, now that we have opted in to Migrations they have been converted into a Migration. Code First has also recorded in our local database that this Migration has already been applied. The timestamp on the filename is used for ordering purposes.
Now let’s make a change to our model, add a Url property to the Blog class:
public class Blog 
{ 
    public int BlogId { get; set; } 
    public string Name { get; set; } 
    public string Url { get; set; } 
 
    public virtual List<Post> Posts { get; set; } 
}

Run the Add-Migration AddUrl command in Package Manager Console. The Add-Migration command checks for changes since your last migration and scaffolds a new migration with any changes that are found. 
We can give migrations a name; in this case we are calling the migration ‘AddUrl’. The scaffolded code is saying that we need to add a Url column, that can hold string data, to the dbo.Blogs table. 
If needed, we could edit the scaffolded code but that’s not required in this case.
namespace CodeFirstNewDatabaseSample.Migrations 
{ 
    using System; 
    using System.Data.Entity.Migrations; 
     
    public partial class AddUrl : DbMigration 
    { 
        public override void Up() 
        { 
            AddColumn("dbo.Blogs", "Url", c => c.String()); 
        } 
         
        public override void Down() 
        { 
            DropColumn("dbo.Blogs", "Url"); 
        } 
    } 
}

Run the Update-Database command in Package Manager Console. This command will apply any pending migrations to the database. Our InitialCreate migration has already been applied so migrations will just apply our new AddUrl migration. Tip: You can use the –Verbose switch when calling Update-Database to see the SQL that is being executed against the database.
The new Url column is now added to the Blogs table in the database: