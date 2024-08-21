<%--
  Created by IntelliJ IDEA.
  User: Trần Ngọc Huyền
  Date: 8/13/2024
  Time: 6:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>
    Danh sách toà nhà
  </title>
</head>
<body>
<div class="main-content">
  <div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
      <script type="text/javascript">
          try {
              ace.settings.check('breadcrumbs', 'fixed')
          } catch (e) {
          }
      </script>

      <ul class="breadcrumb">
        <li>
          <i class="ace-icon fa fa-home home-icon"></i>
          <a href="#">Trang chủ</a>
        </li>
        <li class="active">Danh sách toà nhà</li>
      </ul><!-- /.breadcrumb -->
    </div>

    <div class="page-content">


      <div class="page-header">
        <h1>
          Quản lý toà nhà
          <%--                    <small>--%>
          <%--                        <i class="ace-icon fa fa-angle-double-right"></i>--%>
          <%--                        overview &amp; stats--%>
          <%--                    </small>--%>
        </h1>
      </div><!-- /.page-header -->

      <div class="row">
        <div class="col-xs-12">
          <div class="widget-box ui-sortable-handle">
            <div class="widget-header">
              <h5 class="widget-title">Tìm kiếm</h5>
              <div class="widget-toolbar">
                <a href="#" data-action="collapse">
                  <i class="ace-icon fa fa-chevron-up"></i>
                </a>
              </div>
            </div>

            <div class="widget-body">
              <div class="widget-main" style="font-family: 'Times New Roman', Times, serif;">
                <div class="row" style="margin: 0">
                  <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}" method="get">
                    <div class="row">
                      <div class="col-xs-6">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="name">Tên toà nhà</label> <br>
                            <%--                          <input type="text" class="form-control" id="name" name="name" value="${modelSearch.name}"/>--%>
                          <form:input class="form-control" path="name"/>
                        </div>
                      </div>
                      <div class="col-xs-6">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="floorArea">Diện tích sàn</label> <br/>
                            <%--                          <input type="number" class="form-control" id="floorArea" name="floorArea" value="${modelSearch.floorArea}"/>--%>
                          <form:input class="form-control" path="floorArea"/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-2">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label>Quận</label> <br/>
                          <form:select class="form-control" path="district">
                            <form:option value="">---Chọn quận---</form:option>
                            <form:options items="${districts}"/>
                          </form:select>
                        </div>
                      </div>
                      <div class="col-xs-5">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="ward">Phường</label> <br/>
                            <%--                          <input type="text" class="form-control" id="ward" name="ward" value="${modelSearch.ward}"/>--%>
                          <form:input class="form-control" path="ward"/>
                        </div>
                      </div>
                      <div class="col-xs-5">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="street">Đường</label> <br/>
                            <%--                          <input type="text" class="form-control" id="street" name="street" value="${modelSearch.street}"/>--%>
                          <form:input class="form-control" path="street"/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-4">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="numberOfBasement">Số tầng hầm</label> <br/>
                            <%--                          <input type="text" class="form-control" id="numberOfBasement" name="numberOfBasement" value="${modelSearch.numberOfBasement}"/>--%>
                          <form:input class="form-control" path="numberOfBasement"/>
                        </div>
                      </div>
                      <div class="col-xs-4">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="direction">Hướng</label> <br/>
                            <%--                          <input type="text" class="form-control" id="direction" name="direction" value="${modelSearch.direction}"/>--%>
                          <form:input class="form-control" path="direction"/>
                        </div>
                      </div>
                      <div class="col-xs-4">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="level">Hạng</label> <br/>
                            <%--                          <input type="number" class="form-control" id="level" name="level" value="${modelSearch.level}"/>--%>
                          <form:input class="form-control" path="level"/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-3">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="areaFrom">Diện tích từ</label> <br/>
                            <%--                          <input type="text" class="form-control" id="areaFrom" name="areaFrom" value="${modelSearch.areaFrom}"/>--%>
                          <form:input class="form-control" path="areaFrom"/>
                        </div>
                      </div>
                      <div class="col-xs-3">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="areaTo">Diện tích đến</label> <br/>
                            <%--                          <input type="text" class="form-control" id="areaTo" name="areaTo" value="${modelSearch.areaTo}"/>--%>
                          <form:input class="form-control" path="areaTo"/>
                        </div>
                      </div>
                      <div class="col-xs-3">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="rentPriceFrom">Giá thuê từ</label> <br/>
                            <%--                          <input type="text" class="form-control" id="rentPriceFrom" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}"/>--%>
                          <form:input class="form-control" path="rentPriceFrom"/>
                        </div>
                      </div>
                      <div class="col-xs-3">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="rentPriceTo">Giá thuê đến</label> <br/>
                            <%--                          <input type="text" class="form-control" id="rentPriceTo" name="rentPriceTo" value="${modelSearch.rentPriceTo}"/>--%>
                          <form:input class="form-control" path="rentPriceTo"/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-4">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="managerName">Tên quản lý</label> <br/>
                            <%--                          <input type="text" class="form-control" id="managerName" name="managerName" value="${modelSearch.managerName}"/>--%>
                          <form:input class="form-control" path="managerName"/>
                        </div>
                      </div>
                      <div class="col-xs-4">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="managerPhone">Điện thoại quản
                            lý</label> <br/>
                            <%--                          <input type="text" class="form-control" id="managerPhone" name="managerPhone" value="${modelSearch.managerPhone}"/>--%>
                          <form:input class="form-control" path="managerPhone"/>
                        </div>
                      </div>
                      <div class="col-xs-2">
                        <div class="form-group" style="flex-wrap: wrap">
                          <label for="staffId">Chọn nhân viên phụ trách</label>
                          <br/>
                          <form:select class="form-control" path="staffId">
                            <form:option value="">---Chọn nhân viên---</form:option>
                            <form:options items="${listStaffs}"/>
                          </form:select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="col-xs-6" style="padding: 0px">
                          <form:checkboxes items="${typeCodes}" path="typeCode"/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-12 d-flex">
                        <button type="button" class="btn btn-xs btn-danger" id="btnSearchBuilding">
                          <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor"
                               class="bi bi-search" viewBox="0 0 16 16">
                            <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0">
                            </path>
                          </svg>
                          Tìm kiếm
                        </button>
                      </div>
                    </div>
                  </form:form>

                </div>
              </div>
            </div>

            <div class="pull-right">
              <a href="/admin/building-edit">
                <button class="btn btn-info" title="Thêm toà nhà">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                       class="bi bi-building-add" viewBox="0 0 16 16">
                    <path
                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                    <path
                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                    <path
                            d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                  </svg>
                </button>
              </a>
              <button class="btn btn-danger" title="Xoá toà nhà" id="btnDeleteBuilding">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-building-dash" viewBox="0 0 16 16">
                  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                  <path
                          d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                  <path
                          d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                </svg>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- Table of list building -->
      <div class="row">
        <div class="col-xs-12">
          <table id="tableList" class="table table-striped table-bordered table-hover"
                 style="margin: 3em 0 1.5em;">
            <thead>
            <tr>
              <th class="center">
                <label class="pos-rel">
                  <input type="checkbox" class="ace">
                  <span class="lbl"></span>
                </label>
              </th>
              <th>Tên toà nhà</th>
              <th>Địa chỉ</th>
              <th>Số tầng hầm</th>
              <th>Tên quản lý</th>
              <th>Số điện thoại</th>
              <th>DT sàn</th>
              <th>DT thuê</th>
              <th>Giá thuê</th>
              <th>Phí môi giới</th>
              <th>Phí dịch vụ</th>
              <th>Thao tác</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="b" items="${buildings}">
              <tr>
                <td class="center">
                  <label class="pos-rel">
                    <input type="checkbox" class="ace" name="checkList" value="${b.id}">
                    <span class="lbl"></span>
                  </label>
                </td>

                <td>
                    ${b.name}
                </td>
                <td>${b.address}</td>
                <td>${b.numberOfBasement}</td>
                <td>${b.managerName}</td>
                <td>${b.managerPhoneNumber}</td>
                <td>${b.floorArea}</td>
                <td>${b.rentArea}</td>
                <td>${b.rentPrice}</td>
                <td>${b.brokerageFee}</td>
                <td>${b.serviceFee}</td>
                <td>
                  <div class="hidden-sm hidden-xs btn-group">
                    <button class="btn btn-xs btn-success" title="Giao toà nhà" onclick="assignmentBuilding(${b.id})">
                      <i class="ace-icon fa fa-exchange"></i>
                    </button>

                    <a class="btn btn-xs btn-info" title="Sửa toà nhà" href="/admin/building-edit-${b.id}">
                      <i class="ace-icon fa fa-pencil bigger-120"></i>
                    </a>

                    <button class="btn btn-xs btn-danger" title="Xoá toà nhà" onclick="deleteBuilding(${b.id})">
                      <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    </button>
                  </div>
                </td>
              </tr>
            </c:forEach>

            </tbody>
          </table>
        </div><!-- /.span -->
      </div>
      <!-- END Table of list building -->
    </div><!-- /.page-content -->
  </div>
</div><!-- /.main-content -->

<div id="assignmentBuildingModal" class="modal fade">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Danh sách nhân viên</h4>
      </div>
      <div class="modal-body">
        <table class="table text-center table-striped table-bordered table-hover" id="staffList">
          <thead>
          <tr>
            <th class="center">Chọn</th>
            <th class="center">Tên nhân viên</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td class="center">
              <input type="checkbox" id="checkbox_1" value="1">
            </td>
            <td>
              tnhxinhdep
            </td>
          </tr>
          <tr>
            <td class="center">
              <input type="checkbox" id="checkbox_2" value="2">
            </td>
            <td>
              Trần Ngọc Huyền
            </td>
          </tr>
          </tbody>
        </table>
        <input type="hidden" id="buildingId" name="buildingId" value="1">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="btnAsignmentBuilding">Giao toà nhà</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
      </div>
    </div>

  </div>
</div> <!-- /.modal -->
<script>
    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
    };

    $('#btnAsignmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        console.log('OK');
    });

    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });

    function deleteBuilding(id) {
        var buildingId = [id];
        deleteBuildings(buildingId);
    };

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        // var data = {}
        var buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        deleteBuilding(buildingIds);
    });

    function deleteBuildings(data) {
        //call api
        $.ajax({
            type: "Delete",
            url: "${buildingAPI}/" + data,
            data: JSON.stringify(data), //đưa về dạng JSON
            contentType: "application/json", //định nghĩa kiểu JSON trong post man
            // data, contentType là từ client gửi xuống
            dataType: "JSON",// định dạng data từ server gửi đi
            success: function (respond) {
                console.log("Success");
            },
            error: function (respond) {
                console.log("Failed");
                console.log(respond);
            }
        });
    }


</script>
</body>
</html>

