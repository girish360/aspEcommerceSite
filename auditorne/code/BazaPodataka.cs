using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace auditorne.code
{
    public class BazaPodataka
    {
        private SqlConnection m_connection;
        /// <summary>
        /// Osnovni konstruktor
        /// </summary>
        public BazaPodataka()
        {
            string conn = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ConnectionString;
            m_connection = new SqlConnection(conn);
        }
        /// <summary>
        /// Svojstvo koje vraca SqlConnection objekat
        /// </summary>
        SqlConnection DataBaseConnection
        {
            get { return this.m_connection; }
        }
        /// <summary>
        /// Izvrsava svaku sql proceduru
        /// </summary>
        /// <param name="imeProcedure">Ime Sql Procedure</param>
        /// <param name="comm">Sql komanda</param>
        private void ExecuteProcedure(string imeProcedure, SqlCommand comm)
        {
            comm.Connection = this.DataBaseConnection;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = imeProcedure;
            try
            {
                comm.Connection.Open();
                comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                comm.Connection.Close();
            }
        }

        /// <summary>
        /// Unosi dodatnih podataka o korisniku
        /// </summary>
        /// <param name="kd">Dodatni podaci korisnika</param>
        public void DBInsertKorisnikDodatno(KorisnikDodatno kd)
        {
            SqlCommand insertComm = new SqlCommand();
            insertComm.Parameters.AddWithValue("@idKorisnik", kd.ID);
            insertComm.Parameters.AddWithValue("@imePrezime", kd.ImePrezime);
            insertComm.Parameters.AddWithValue("@pol", kd.Pol);
            insertComm.Parameters.AddWithValue("@godinaRodjenja", kd.GodinaRodjenja);
            try
            {
                this.ExecuteProcedure("InsertKorisnikDodatno", insertComm);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// Update dodatnih podataka o korisniku
        /// </summary>
        /// <param name="kd">Dodatni podaci korisnika</param>
        public void DBUpdateKorisnikDodatno(KorisnikDodatno kd)
        {
            SqlCommand updateComm = new SqlCommand();
            updateComm.Parameters.AddWithValue("@idKorisnik", kd.ID);
            updateComm.Parameters.AddWithValue("@imePrezime", kd.ImePrezime);
            updateComm.Parameters.AddWithValue("@pol", kd.Pol);
            updateComm.Parameters.AddWithValue("@godinaRodjenja", kd.GodinaRodjenja);
            try
            {
                this.ExecuteProcedure("UpdateKorisnikDodatno", updateComm);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Delete dodatnih podataka o korisniku
        /// </summary>
        /// <param name="kd">Dodatni podaci korisnika</param>
        public void DBDeleteKorisnikDodatno(KorisnikDodatno kd)
        {
            SqlCommand deleteComm = new SqlCommand();
            deleteComm.Parameters.AddWithValue("@idKorisnik", kd.ID);
            try
            {
                this.ExecuteProcedure("DeleteKorisnikDodatno", deleteComm);
            }
            catch (Exception ex) { throw ex; }
        }
        /// <summary>
        /// Vraca dodatne podatke o korisniku iz baze
        /// </summary>
        /// <param name="id">Guid korisnika</param>
        /// <returns>Instancu objeka sa dodatnim podacima</returns>
        public KorisnikDodatno DBGetKorisnikDodatno(Guid id)
        {
            KorisnikDodatno korisnik = new KorisnikDodatno();
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = this.DataBaseConnection;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "SelectKorisnikDodatno";
            komanda.Parameters.AddWithValue("@UserId", id);
            try
            {
                komanda.Connection.Open();
                SqlDataReader reader = komanda.ExecuteReader();
                while (reader.Read())
                {
                    korisnik.ID = new Guid(reader["idKorisnik"].ToString());
                    korisnik.ImePrezime = reader["imePrezime"].ToString();
                    korisnik.Pol = reader["pol"].ToString().ToCharArray()[0];
                    korisnik.GodinaRodjenja = reader["godinaRodjenja"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { komanda.Connection.Close(); }
            return korisnik;
        }
    }
}