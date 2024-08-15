package com.javaweb.api.admin;

import com.javaweb.model.dto.BuildingDTO;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @PostMapping
    public BuildingDTO addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        //Xuống DB để update hoặc thêm mới
        return buildingDTO;
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@RequestBody List<Long> ids) {
        //Xuống DB để xoá building theo danh sách id gửi về
        System.out.println("tnhxinhdep");
    }
}
