package com.provaDB.jsp;
import java.sql.*;

import javax.swing.JOptionPane;

public class ConnessioneDBMySQL {
	private int errore;
	public ConnessioneDBMySQL() {
		// Costruttore
		setErrore (0);
	}
	public int getErrore() {
		return errore;
	}
	private void setErrore(int errore) {
		this.errore = errore;
	}
	public Connection connettiDB(String indirizzoDB, String user, String psw) {
		Connection connection = null;
		String dbURL = "jdbc:mysql://" + indirizzoDB;
		try {
			// Step 2.A: Create and get connection using DriverManager class
			connection = DriverManager.getConnection(dbURL,user,psw);
			setErrore(1);
		}
		catch (SQLException sqlex){
			JOptionPane.showMessageDialog(null, "Errore Accesso Database: percorso errato");
			sqlex.printStackTrace();
			setErrore(0);
		}
		return connection;
	}
}
