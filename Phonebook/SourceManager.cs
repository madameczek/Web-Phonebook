using Phonebook.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Phonebook
{
    public class SourceManager : IDisposable
    {
        readonly SqlConnection connection;

        public SourceManager() //ctor
        {
            connection = new SqlConnection
            {
                ConnectionString = "Integrated Security=SSPI;" +
                    "Initial Catalog=Phonebook;" +
                    "Data Source=.\\SQLEXPRESS;"
            };
            connection.Open();
        }

        /// <summary>
        /// Returns List<PersonModel> from database to be displayed on one page
        /// </summary>
        /// <param name="start">starting row (!=0)</param>
        /// <param name="take">numer of rows to be returned</param>
        /// <param name="search"></param>
        /// <returns>List<PersonModel></returns>
        public List<PersonModel> Get(int start, int take, string search)
        {
            SqlCommand command = new SqlCommand
            {
                CommandText = "select * from People where [LastName] like @Search " +
                    "order by LastName offset(@Skip) rows fetch next(@Take) rows only",
                Connection = connection
            };
            command.Parameters.AddWithValue("@Skip", start - 1);
            command.Parameters.AddWithValue("@Take", take);
            command.Parameters.AddWithValue("@Search", search);
            SqlDataReader reader = command.ExecuteReader();
            return CreatePeopleList(reader);
        }

        public PersonModel GetById(int id)
        {
            SqlCommand command = new SqlCommand
            {
                CommandText = "SELECT * FROM People where [Id]=@Id",
                Connection = connection
            };
            command.Parameters.AddWithValue("@Id", id).SqlDbType = SqlDbType.Int;
            SqlDataReader reader = command.ExecuteReader();
            return CreatePeopleList(reader)[0];
        }

        public int Add(PersonModel person)
        {
            SqlCommand command = new SqlCommand
            {
                CommandText = "insert into People([FirstName], [LastName], [Phone], [Email], [Created]) " +
                    "values(@FirstName, @LastName, @Phone, @Email, @Created);" +
                    "select scope_identity();",
                Connection = connection
            };
            command.Parameters.AddWithValue("@FirstName", person.FirstName ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@LastName", person.LastName ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@Phone", person.Phone ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@Email", person.Email ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@Created", person.Created).SqlDbType = System.Data.SqlDbType.DateTimeOffset;
            return Convert.ToInt32(command.ExecuteScalar());
        }

        public void Update(PersonModel person)
        {
            SqlCommand command = new SqlCommand
            {
                CommandText = "update People set [FirstName]=@FirstName, [LastName]=@LastName, [Phone]=@Phone, " +
                "[Email]=@Email, [Updated]=@Updated where [Id]=@Id;",
                Connection = connection
            };
            command.Parameters.AddWithValue("@Id", person.Id).SqlDbType = SqlDbType.Int;
            command.Parameters.AddWithValue("@FirstName", person.FirstName ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@LastName", person.LastName ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@Phone", person.Phone ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@Email", person.Email ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@Updated", person.Updated).SqlDbType = System.Data.SqlDbType.DateTimeOffset;
            _ = command.ExecuteNonQuery();
            return;
        }

        public void Remove(int id)
        {
            SqlCommand command = new SqlCommand
            {
                CommandText = "delete from People where [Id]=@Id",
                Connection = connection
            };
            command.Parameters.AddWithValue("@Id", id).SqlDbType = SqlDbType.Int;
            _ = command.ExecuteNonQuery();
            return;
        }

        public int GetPeopleCount()
        {
            SqlCommand command = new SqlCommand()
            {
                CommandText = "select count(*) from People",
                Connection = connection
            };
            return (int)command.ExecuteScalar();
        }

        private List<PersonModel> CreatePeopleList(SqlDataReader reader)
        {
            List<PersonModel> people = new List<PersonModel>();
            while (reader.Read())
            {
                PersonModel person = new PersonModel
                {
                    Id = reader.GetInt32("Id"),
                    Created = reader.GetDateTimeOffset(reader.GetOrdinal("Created"))
                };
                if (!(reader["FirstName"] is DBNull)) { person.FirstName = reader["FirstName"].ToString(); }
                if (!(reader["LastName"] is DBNull)) { person.LastName = reader["LastName"].ToString(); }
                if (!(reader["Phone"] is DBNull)) { person.Phone = reader["Phone"].ToString(); }
                if (!(reader["Email"] is DBNull)) { person.Email = reader["Email"].ToString(); }
                if (!(reader["Updated"] is DBNull)) { person.Updated = reader.GetDateTimeOffset(reader.GetOrdinal("Updated")); }
                people.Add(person);
            }
            return people;
        }

        public void Dispose() { connection.Dispose(); } // implementacja IDisposable. Zamknie połączenie
    }
}
