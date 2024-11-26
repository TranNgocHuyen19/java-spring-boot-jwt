package com.javaweb.converter;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AssignmentBuildingConverter {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    public List<AssignmentBuildingEntity> convertToEntity(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<AssignmentBuildingEntity> result = new ArrayList<>();
        Long buildingId = assignmentBuildingDTO.getBuildingId();
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        for(Long staffId : staffIds) {
            AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
            assignmentBuildingEntity.setBuildingEntity(buildingRepository.findById(buildingId).get());
            assignmentBuildingEntity.setUserEntity(userRepository.findById(staffId).get());
            result.add(assignmentBuildingEntity);
        }
        return result;
    }
}
