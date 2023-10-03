package com.java.veggieats.restaurant.repository;

import com.java.veggieats.restaurant.entity.RestaurantEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RestaurantRepository extends JpaRepository<RestaurantEntity, String> {
}
