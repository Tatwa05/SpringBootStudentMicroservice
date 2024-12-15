package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long>
{
	@Query("select s from Student s where s.id=?1 and s.password=?2")
	public Student studentlogin(Long id, String password);
	
	@Modifying
	@Transactional
	@Query("update Student s set s.password=?1 where s.id=?2")
	public int changepassword(String pwd,long sid);
}
