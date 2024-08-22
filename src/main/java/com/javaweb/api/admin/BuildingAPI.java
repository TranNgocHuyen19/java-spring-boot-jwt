package com.javaweb.api.admin;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private IBuildingService buildingService;

    @PostMapping
    public void addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        buildingService.addOrUpdateBuilding(buildingDTO);
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids) {
        buildingService.deleteBuildings(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaff(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }
}
