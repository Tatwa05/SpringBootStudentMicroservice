package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.AppliedJobs;

import jakarta.transaction.Transactional;

@Repository
public interface AppliedJobsRepository extends JpaRepository<AppliedJobs, Integer>
{
	@Query("select COUNT(ap) from AppliedJobs ap where ap.student.id=?1 and ap.jobs.id=?2")
	public  long findifapplied(long sid, int jobid);
	
	@Query("select ap from AppliedJobs ap where ap.student.id=?1")
	public  List<AppliedJobs> findallappliedjobs(long sid);
	
	@Query("select ap from AppliedJobs ap where ap.student.id=?1 and ap.status=?2")
	public  List<AppliedJobs> getapplicationsbystatus(long sid,String status);
	
	@Modifying
    @Transactional
    @Query("update AppliedJobs ap set ap.status=?1 where ap.id=?2")
    public int updatestudentappliedjobstatus(String status, int id);
	
	@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status!='Watchlist'")
	public long getstudentapplicationcount(long sid);
	
	@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status='Interview'")
	public long getstudentinterviewscount(long sid);
	
	@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status='Selected'")
	public long getstudentselectedcount(long sid);
	
	@Query("select count(ap) from AppliedJobs ap where ap.student.id=?1 and ap.status='Shortlisted'")
	public long getstudentshortlistedcount(long sid);
	
	
	
	
	
}
