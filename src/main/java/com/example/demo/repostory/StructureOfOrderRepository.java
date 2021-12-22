package com.example.demo.repostory;

import com.example.demo.entity.Structure_of_order;
import com.example.demo.entity.Structure_of_order_id;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StructureOfOrderRepository extends JpaRepository<Structure_of_order, Structure_of_order_id> {
//    Structure_of_order findStructure_of_orderById(Structure_of_order_id structure_of_order_id);
}
