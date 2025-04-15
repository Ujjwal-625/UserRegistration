package org.example.demo;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserLogin" ,value = "/login")
public class LoginServlet extends HelloServlet{


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            try{
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String contentType = req.getContentType();
        String username = null;
        String password = null;

        if (contentType != null && contentType.contains("application/json")) {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode node = mapper.readTree(req.getReader());
            username = node.get("username").asText();
            password = node.get("password").asText();
        } else {
            // Handle form data (application/x-www-form-urlencoded)
            username = req.getParameter("username");
            password = req.getParameter("password");
        }

        ObjectMapper mapper = new ObjectMapper();
        List<JsonNode> Users = new ArrayList<>();

        final String path = getServletContext().getRealPath("/") + "UserData/user.json" ;

        File file = new File(path);
        if (file.exists()) {
            Users = mapper.readValue(file, new com.fasterxml.jackson.core.type.TypeReference<List<JsonNode>>() {});
        }

        for (JsonNode user : Users) {
            if (username.equals(user.get("username").asText()) && password.equals(user.get("password").asText())) {
                res.setStatus(HttpServletResponse.SC_CONFLICT);
                System.out.println("Found User");
                try {
                    req.getRequestDispatcher("/dashboard.jsp").forward(req, res);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
                return;
            }
        }


        res.setStatus(HttpServletResponse.SC_CREATED);
        res.setContentType("text/html");
        // Hello
        PrintWriter out = res.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + "Invalid UserName or Password" + "</h1>");
        out.println("</body></html>");
    }

}
