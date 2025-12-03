package com.lume.panel.portal.repositories;

import com.lume.panel.portal.models.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface IUserRepository extends JpaRepository<UserModel, UUID> {
    Optional<UserModel> findById(UUID id);
    Optional<UserModel> findByEmail(String email);
}
