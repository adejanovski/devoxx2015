package fr.chronopost.labs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.fasterxml.jackson.databind.ObjectMapper;

import fr.chronopost.labs.data.CassandraAccess;
import fr.chronopost.labs.servlet.model.SpeakerBean;

@WebServlet(asyncSupported = false, value = "/get-count-speakers", loadOnStartup = 1)
public class getCountSpeakersServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7457972278668830558L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/plain");

		PrintWriter out = response.getWriter();

		out.print(CassandraAccess.INSTANCE.getNbSpeakers());


	}

	protected void doGet(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(req, response);

	}

	
	

	
		
		

	

	

}
