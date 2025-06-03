package org.example.mvc.service;



import org.example.mvc.entity.Student;
import org.example.mvc.repository.IStudentRepository;
import org.example.mvc.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> findAll() {

        return studentRepository.findAll();
    }

    @Override
    public void add(Student student) {
            studentRepository.add(student);
    }
}
