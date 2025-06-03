package org.example.mvc.repository;


import org.example.mvc.entity.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    void add(Student student);
}
