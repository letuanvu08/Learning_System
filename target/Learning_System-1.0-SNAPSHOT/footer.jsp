<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Footer Section Begin -->
  <footer class="footer spad">
      <div class="container">
          <div class="row">
              <div class="col-lg-3 col-md-6 col-sm-6">
                  <div class="footer__about">
                      <div class="footer__about__logo">
                          <a href="${pageContext.request.contextPath}/customer/main"><img src="${pageContext.request.contextPath}/img/logobk.png" style="width: 100px" alt=""></a>
                      </div>

                  </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                  <div class="footer__widget">
                      <h6>Các thông tin khác</h6>
                      <ul>
                          <li><a href="#">Về chúng tôi</a></li>
                          <li><a href="#">Về trang web</a></li>


                      </ul>
                      <ul>

                          <li><a href="#">Dịch vụ của chúng tôi</a></li>

                          <li><a href="#">Thông tin liên lạc</a></li>
                      </ul>
                  </div>
              </div>
              <div class="col-lg-4 col-md-12">
                  <div class="footer__widget">
                      <h6>Theo dõi bảng tin của chúng tôi</h6>
                      <p>Cập nhật các tin tức mới nhất về các gian hàng và thông tin giảm giá mới nhất.</p>
                      <form action="#">
                          <input type="text" placeholder="Email của bạn">
                          <button type="submit" class="site-btn">Đăng ký</button>
                      </form>
                      <div class="footer__widget__social">
                          <a href="#"><i class="fa fa-facebook"></i></a>
                          <a href="#"><i class="fa fa-instagram"></i></a>
                          <a href="#"><i class="fa fa-twitter"></i></a>
                          <a href="#"><i class="fa fa-pinterest"></i></a>
                      </div>
                  </div>
              </div>
          </div>
          <div class="row">
              <div class="col-lg-12">
                  <div class="footer__copyright">
                      <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                      <div class="footer__copyright__payment"><img src="${pageContext.request.contextPath}/img/payment-item.png" alt=""></div>
                  </div>
              </div>
          </div>
      </div>
  </footer>
  <!-- Footer Section End -->