package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Jobs;
import java.util.List;


@Repository
public interface JobsRepository extends JpaRepository<Jobs, Integer>
{
	@Query("select count(j) from Jobs j where j.status='Active'")
	public long activejobscount();
	
	@Query("select count(distinct j.company) from Jobs j")
	public long recruitingcompanies();
}
