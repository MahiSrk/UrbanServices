package com.urban;

import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;

import java.io.File;

public class Main {
    public static void main(String[] args) throws LifecycleException {
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(8080);

        // Set base directory for Tomcat
        tomcat.setBaseDir("temp");

        // Set path to web content folder (adjust if needed)
        String webappDirLocation = "src/main/webapp";
        File webContentFolder = new File(webappDirLocation);
        
        if (!webContentFolder.exists()) {
            System.err.println("⚠️ Web content folder not found: " + webappDirLocation);
            System.err.println("❌ Please make sure your project contains a valid webapp folder.");
            return;
        }

        tomcat.addWebapp("/urbanservices", webContentFolder.getAbsolutePath());

        System.out.println("✅ Starting Tomcat server on http://localhost:8080/urbanservices/");
        tomcat.start();
        tomcat.getServer().await();
    }
}



