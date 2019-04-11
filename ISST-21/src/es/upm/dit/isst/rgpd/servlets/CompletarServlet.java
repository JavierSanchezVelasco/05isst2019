package es.upm.dit.isst.rgpd.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import es.upm.dit.isst.rgpd.dao.EvaluacionDAO;
import es.upm.dit.isst.rgpd.dao.EvaluacionDAOImplementation;
import es.upm.dit.isst.rgpd.dao.InvestigadorDAO;
import es.upm.dit.isst.rgpd.dao.InvestigadorDAOImplementation;
import es.upm.dit.isst.rgpd.dao.SolicitudDAO;
import es.upm.dit.isst.rgpd.dao.SolicitudDAOImplementation;
import es.upm.dit.isst.rgpd.model.Evaluacion;
import es.upm.dit.isst.rgpd.model.Investigador;
import es.upm.dit.isst.rgpd.model.Solicitud;

@WebServlet( "/CompletarServlet")

public class CompletarServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String idsString = req.getParameter( "ids" );
		String emailEvaluador = req.getParameter("emailEvaluador");
		Long ids = Long.parseLong(idsString);
		SolicitudDAO sdao = SolicitudDAOImplementation.getInstance();
		Solicitud solicitud = sdao.read(ids);
		
		//primer evaluador
		solicitud.setEstado(5);
		sdao.update(solicitud);

		
		//mando datos que necesita la siguiente vista
		req.getSession().setAttribute( "id", ids );
		req.getSession().setAttribute( "ide", emailEvaluador);		
		getServletContext().getRequestDispatcher( "/FaltanDatosView.jsp" ).forward( req, resp );
	
	
	}
		
}
