package com.java.veggieats.restaurant.repository;

import com.java.veggieats.restaurant.entity.ReservationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<ReservationEntity, String> {

}
