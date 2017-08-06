﻿using System;
using System.Collections.Generic;
using System.Transactions;
using Viva.DAL.Entities;

namespace Viva.DAL.Initializers
{
    public class CreateDatabaseIfNotExists : System.Data.Entity.CreateDatabaseIfNotExists<BookStoreDbContext>
    {
        public override void InitializeDatabase(BookStoreDbContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }

            bool databaseExists;
            using (new TransactionScope(TransactionScopeOption.Suppress))
            {
                databaseExists = context.Database.Exists();
            }

            if (databaseExists)
            {
                // If there is no metadata either in the model or in the databaase, then
                // we assume that the database matches the model because the common cases for
                // these scenarios are database/model first and/or an existing database.
                if (!context.Database.CompatibleWithModel(throwIfNoMetadata: false))
                {
                    throw new InvalidOperationException(string.Format("The model backing the '{0}' context has changed since the database was created. Either manually delete/update the database, or call Database.SetInitializer with an IDatabaseInitializer instance. For example, the DropCreateDatabaseIfModelChanges strategy will automatically delete and recreate the database, and optionally seed it with new data.", context.GetType().Name));
                }
            }
            else
            {
                context.Database.Create();
                this.Seed(context);
                context.SaveChanges();
            }
        }

        protected override void Seed(BookStoreDbContext context)
        {
            this.CreateCategories(context);
            this.CreateRoles(context);
            this.CreateCustomers(context);
        }

        private void CreateCategories(BookStoreDbContext context)
        {
            var categories = new List<Category>
            {
                new Category {CategoryName="Business", CreatedDate = DateTime.Now },
                new Category {CategoryName="Cookery", CreatedDate = DateTime.Now},
                new Category {CategoryName="Fiction", CreatedDate = DateTime.Now},
                new Category {CategoryName="Non Fiction", CreatedDate = DateTime.Now},
                new Category {CategoryName="Leisure", CreatedDate = DateTime.Now},
                new Category {CategoryName="Travel", CreatedDate = DateTime.Now},
                new Category {CategoryName="Spritual", CreatedDate = DateTime.Now}
            };

            categories.ForEach(c => context.Categories.Add(c));

            context.SaveChanges();
        }

        private void CreateRoles(BookStoreDbContext context)
        {
            var roles = new List<Role>
            {
                new Role {RoleName="SysAdmin", CreatedDate = DateTime.Now},
                new Role {RoleName="Admin", CreatedDate = DateTime.Now},
                new Role {RoleName="User", CreatedDate = DateTime.Now},
            };

            roles.ForEach(r => context.Roles.Add(r));

            context.SaveChanges();
        }

        private void CreateCustomers(BookStoreDbContext context)
        {
            var customers = new List<Customer>
            {
                new Customer {
                    UserName="hellen.nguyen",
                    Password="123456",
                    FirstName ="Hellen",
                    LastName ="Nguyen",
                    Address ="123 Queen Str",
                    Surburb ="CBD",
                    City ="Auckland",
                    Zipcode = "NZ",
                    EmailAddress ="ntthanhthao@outlook.com",
                    PhoneNumber="+64 229009000",
                    HearUs= "Website",
                    HowContactYou="Phone",
                    Subscribe=false,
                    Active = true,
                    CreditCardNumber="123....90",
                    CardExpiredDate="12/20",
                    RoleId = 1, CreatedDate = DateTime.Now

                },

                new Customer {
                    UserName="tiana.mohemet",
                    Password="123456",
                    FirstName ="tiana",
                    LastName ="mohemet",
                    Address ="456 Queen Str",
                    Surburb ="CBD",
                    City ="Auckland",
                    Zipcode = "NZ",
                    EmailAddress ="tiana.mohemet@outlook.com",
                    PhoneNumber="+64 2290099999",
                    Subscribe=false,
                    Active = true,
                    CreditCardNumber="333....90",
                    CardExpiredDate="12/20",
                    RoleId = 1, CreatedDate = DateTime.Now
                },

                new Customer {
                    UserName="linda.ran",
                    Password="123456",
                    FirstName ="Linda",
                    LastName ="ran",
                    Address ="789 Queen Str",
                    Surburb ="CBD",
                    City ="Auckland",
                    Zipcode = "NZ",
                    EmailAddress ="linda.ran@outlook.com",
                    PhoneNumber="+64 22900991239",
                    Subscribe=false,
                    Active = true,
                    CreditCardNumber="9999....99",
                    CardExpiredDate="12/20",
                    RoleId = 1, CreatedDate = DateTime.Now
                },
            };

            customers.ForEach(c => context.Customers.Add(c));

            context.SaveChanges();
        }
        
    }
}
