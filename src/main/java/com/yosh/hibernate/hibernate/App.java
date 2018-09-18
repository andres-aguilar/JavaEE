package com.yosh.hibernate.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.yosh.hibernate.hibernate.models.Course;
import com.yosh.hibernate.hibernate.models.Teacher;

public class App 
{
    public static void main( String[] args )
    {
        Configuration configuration = new Configuration();
        configuration.configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        
        Session session = sessionFactory.openSession();
        
        // Teacher teacher = new Teacher("Andres Aguilar", "yosh");
        Course course = new Course("Java Avanzado", "Spring, hibernate", "REST API");
        
        session.beginTransaction();
        session.save(course);
        session.getTransaction().commit();
        session.close();
    }
}
