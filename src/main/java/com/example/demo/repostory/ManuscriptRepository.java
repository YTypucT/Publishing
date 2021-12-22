package com.example.demo.repostory;

import com.example.demo.entity.Manuscript;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManuscriptRepository extends JpaRepository<Manuscript, Integer> {
}
