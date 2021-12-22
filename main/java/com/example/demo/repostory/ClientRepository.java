package com.example.demo.repostory;

import com.example.demo.entity.Book;
import com.example.demo.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, String> {

    @Query(value = "SELECT b from Client as b where b.Name_client = ?1")
    Client findByNameClient(String Name_client);
}
