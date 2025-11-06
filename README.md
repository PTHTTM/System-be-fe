# Đồ án Hệ thống Thương mại Điện tử (Tech Shop)

Đây là một dự án thương mại điện tử hoàn chỉnh được xây dựng theo kiến trúc Microservices, bao gồm giao diện cho khách hàng và trang quản trị (admin dashboard).

## 1. Giới thiệu

Hệ thống mô phỏng một cửa hàng công nghệ (Tech Shop), cho phép người dùng xem sản phẩm, quản lý giỏ hàng, đặt hàng và thanh toán. Quản trị viên có thể quản lý sản phẩm, đơn hàng, người dùng và xem thống kê.

### Kiến trúc hệ thống


[Image of a microservice e-commerce architecture diagram]

Dự án được chia thành nhiều dịch vụ (services) độc lập, giao tiếp với nhau qua API:

* **`config-server`**: Dịch vụ quản lý cấu hình tập trung cho tất cả các service khác.
* **`eureka-server`**: Dịch vụ đăng ký và khám phá (Service Discovery), giúp các service tìm thấy nhau.
* **`api-gateway`**: Cổng API (API Gateway) là điểm vào duy nhất cho tất cả các yêu cầu từ frontend, thực hiện định tuyến (routing) và xác thực.
* **`user-service`**: Quản lý thông tin người dùng, xác thực (authentication) và phân quyền (authorization).
* **`product-service`**: Quản lý thông tin sản phẩm, danh mục, tồn kho và đánh giá (reviews).
* **`order-service`**: Quản lý giỏ hàng, quá trình đặt hàng và thanh toán.
* **`admin-service`**: Tổng hợp dữ liệu và cung cấp các API cho trang admin.

### Giao diện
* **`smartvn-frontend`**: Giao diện website cho khách hàng.
* **`admin-smartVN`**: Giao diện trang quản trị.

## 2. Công nghệ sử dụng

* **Backend**: Java 17+, Spring Boot 3+, Spring Cloud
* **Frontend**: React (Vite), TailwindCSS
* **Database**: MySQL (hoặc PostgreSQL, tùy cấu hình)
* **Infrastructure**: Docker, Docker Compose

## 3. Hướng dẫn chạy (Sử dụng Docker Compose)

Cách dễ nhất để chạy toàn bộ hệ thống là sử dụng Docker và Docker Compose.

### 3.1. Yêu cầu hệ thống
* [Docker](https://www.docker.com/get-started)
* [Docker Compose](https://docs.docker.com/compose/install/)

### 3.2. Các bước thực thi

1.  **Clone Repository**
    (Bỏ qua bước này nếu bạn đã có sẵn mã nguồn)
    ```bash
    git clone [URL_REPOSITORY_CUA_BAN]
    cd system-be-fe
    ```

2.  **Khởi tạo Cơ sở dữ liệu (Database)**
    Dự án này sử dụng file dump SQL tại `dumps/TechShopDB.sql` để khởi tạo dữ liệu mẫu.

    a. **Khởi động service database** (Giả sử service tên là `mysql` trong file `docker-compose.yml`):
    ```bash
    docker-compose up -d mysql
    ```
    *Lưu ý: Tên service `mysql` có thể khác, vui lòng kiểm tra file `docker-compose.yml` của bạn.*

    b. **Chờ database sẵn sàng** (đợi khoảng 30-60 giây).

    c. **Import dữ liệu từ file dump:**
    Mở một terminal khác và chạy lệnh sau. Lệnh này sẽ thực thi file `.sql` bên trong container database đang chạy.

    ```bash
    docker-compose exec -T mysql mysql -u[USERNAME] -p[PASSWORD] [DB_NAME] < dumps/TechShopDB.sql
    ```

    **Quan trọng:** Hãy thay thế `[USERNAME]`, `[PASSWORD]`, và `[DB_NAME]` bằng các giá trị thực tế bạn đã định nghĩa trong file `docker-compose.yml` (thường trong mục `environment` của service database).

3.  **Build và Chạy toàn bộ hệ thống**
    Sau khi database đã được import, tiến hành build images và khởi chạy tất cả các services:

    ```bash
    docker-compose up --build -d
    ```
    Lệnh `--build` sẽ yêu cầu Docker build lại các images từ `Dockerfile` của từng service. Quá trình này có thể mất vài phút ở lần chạy đầu tiên.

4.  **Kiểm tra trạng thái**
    Bạn có thể xem log của tất cả các container để đảm bảo chúng đã khởi động thành công (đặc biệt là `eureka-server` và `config-server` phải chạy trước).

    ```bash
    docker-compose logs -f
    ```
    Chờ đến khi tất cả các service (user, product, order...) đăng ký thành công với Eureka.

## 4. Truy cập ứng dụng

Sau khi tất cả các dịch vụ đã khởi động, bạn có thể truy cập hệ thống qua các cổng (port) sau (mặc định):

* **Trang khách hàng**: [http://localhost:3000](http://localhost:3000)
* **Trang quản trị (Admin)**: [http://localhost:3001](http://localhost:3001)
* **API Gateway**: [http://localhost:8080](http://localhost:8080)
* **Eureka Dashboard**: [http://localhost:8761](http://localhost:8761)

*Lưu ý: Các cổng (port) trên là giả định. Vui lòng kiểm tra mục `ports` trong file `docker-compose.yml` để biết cổng chính xác.*

## 5. Dừng ứng dụng

Để dừng và xóa tất cả các container đang chạy:
```bash
docker-compose down
