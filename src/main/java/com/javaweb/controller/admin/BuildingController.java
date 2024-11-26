package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.NumberUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;

    @Autowired
    private IBuildingService buildingService;

    @RequestMapping(value="/admin/building-list", method=RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        buildingSearchRequest.setLimit(2);

        Integer page = 1;
        String sPage = request.getParameter("page");

        if (StringUtils.isNotBlank(sPage)) {
            try {
                page = Integer.parseInt(sPage);
                if (page <= 0) {
                    page = 1;
                }
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        buildingSearchRequest.setPage(page);
        buildingSearchRequest.setTotalItems(buildingService.calcTotalItem(buildingSearchRequest));
        buildingSearchRequest.setTotalPage();

        if(buildingSearchRequest.getPage() > buildingSearchRequest.getTotalPage()) {
            buildingSearchRequest.setPage(buildingSearchRequest.getTotalPage());
        }

       //Xuống DB
        List<BuildingSearchResponse> responseList = buildingService.findByCriteria(buildingSearchRequest);
        mav.addObject("buildings", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        mav.addObject("modelSearch", buildingSearchRequest);
        return mav;
    }

    @RequestMapping(value="/admin/building-edit", method=RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    @RequestMapping(value="/admin/building-edit-{id}", method=RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //Xuống DB tìm building theo id
        BuildingDTO buildingDTO = buildingService.findBuildingById(id);
        //Cầm building trả ra view
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }
}
