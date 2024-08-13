<%--
  Created by IntelliJ IDEA.
  User: Trần Ngọc Huyền
  Date: 8/13/2024
  Time: 6:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        Thêm toà nhà
    </title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Thêm toà nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">


            <div class="page-header">
                <h1>
                    Cập nhật thông tin toà nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12" style="font-family:'Times New Roman', Times, serif;">
                    <form id="form-edit" class="form-horizontal">
                        <div class="form-group">
                            <label for="name" class="col-xs-3">Tên toà nhà</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3">Quận</label>
                            <div class="col-xs-2">
                                <select class="form-control" name="districtId" id="districtId">
                                    <option selected>---Chọn quận---</option>
                                    <option value="1">Quận 1</option>
                                    <option value="2">Quận 2</option>
                                    <option value="3">Quận 3</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ward" class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="ward" name="ward">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="street" class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="street" name="street">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="structure" class="col-xs-3">Kết cấu</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="structure" name="structure">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="numberOfBasement" class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                                <input type="number" class="form-control" id="numberOfBasement"
                                       name="numberOfBasement">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="floorArea" class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                                <input type="number" class="form-control" id="floorArea" name="floorArea">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="direction" class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="direction" name="direction">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="level" class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="level" name="level">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rentArea" class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="rentArea" name="rentArea">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rentPrice" class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                                <input type="number" class="form-control" id="rentPrice" name="rentPrice">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rentPriceDescription" class="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="rentPriceDescription"
                                       name="rentPriceDescription">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="serviceFee" class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="serviceFee" name="serviceFee">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="carFee" class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="carFee" name="carFee">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="motorbikeFee" class="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="motorbikeFee" name="motorbikeFee">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="overtimeFee" class="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="overtimeFee" name="overtimeFee">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="electricityFee" class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="electricityFee" name="electricityFee">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="deposit" class="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="deposit" name="deposit">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="payment" class="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="payment" name="payment">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rentTime" class="col-xs-3">Thời hạn thuê</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="rentTime" name="rentTime">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="decorationTime" class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="decorationTime" name="decorationTime">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="managerName" class="col-xs-3">Tên quản lý</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="managerName" name="managerName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="managerPhoneNumber" class="col-xs-3">Số điện thoại quản lý</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="managerPhoneNumber"
                                       name="managerPhoneNumber">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="brokerageFee" class="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="brokerageFee" name="brokerageFee">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3">Loại toà nhà</label>
                            <div class="col-xs-9">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="typeCode" value="noi-that">Nội thất
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="typeCode" value="nguyen-can">Nguyên căn
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="typeCode" value="tang-tret">Tầng trệt
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note" class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="note" name="note">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="brokerageFee" class="col-xs-3">Hình đại diện</label>
                            <div class="col-xs-9">
                                <input type="file" class="form-control" id="avatar" name="avatar">
                            </div>
                        </div>
                        <div class=form-group>
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <button type="button" class="btn btn-info" id="btnAddBuilding">Thêm toà nhà</button>
                                <button type="button" class="btn btn-danger">Huỷ thao tác</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
</body>
</html>
