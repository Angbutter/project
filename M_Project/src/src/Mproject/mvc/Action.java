package Mproject.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action{
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException;
}