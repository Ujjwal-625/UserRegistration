package org.example.demo;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try{
            request.getRequestDispatcher("/signup.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("doPost signup");
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

        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        ObjectMapper mapper = new ObjectMapper();
        List<JsonNode> Users = new ArrayList<>();

        final String path = getServletContext().getRealPath("/") + "UserData/user.json" ;
        System.out.println("path: " + path);

        File file = new File(path);
        if (file.exists()) {
            Users = mapper.readValue(file, new com.fasterxml.jackson.core.type.TypeReference<List<JsonNode>>() {});
        }

        for (JsonNode user : Users) {
            if (username.equals(user.get("username").asText()) && password.equals(user.get("password").asText())) {
                res.setStatus(HttpServletResponse.SC_CONFLICT);
                System.out.println("User Already Exists");
                try {
                    req.getRequestDispatcher("/dashboard.jsp").forward(req, res);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
                return;
            }
        }

        // Create a new user object manually
        JsonNode newUser = mapper.createObjectNode()
                .put("username", username)
                .put("password", password);
        Users.add(newUser);

        mapper.writeValue(file, Users);
        res.setStatus(HttpServletResponse.SC_CREATED);

        try {
            req.getRequestDispatcher("/dashboard.jsp").forward(req, res);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }


}
