# Run selenium Chrome with Robotframework In Docker

#### Build Image From Dockerfile
```````````````````````````````````````````````````````````````````````````
docker build --rm -f "Dockerfile" -t todolist:qa .
```````````````````````````````````````````````````````````````````````````
docker build → docker จะเอาคำสั่งทั้งหมดใน Dockerfile มา build เป็น Docker Image

--rm → หลังจาก build Image เสร็จ ก็จะลบ Container ที่ใช้ในการ build Image ทิ้ง

-f → ใส่ path Dockerfile ที่จะเอามา build image

-t → ตั้งชื่อ Docker Image และ ชื่อ Tag

. → build จากตำแหน่งปัจจุบัน

#### Create Container and Run Robotframework with command
`````````````````````````````````````````````````````````````````````````````````````````````````
docker run -v $(pwd):/workspace:cached -w /workspace todolist:qa python3 -m robot -d log *.robot
```````````````````````
Or
```````````````````````
docker run --rm -v $(pwd):/workspace:cached -w /workspace todolist:qa python3 -m robot -d log *.robot
*** --rm → หลังจาก รันหรือใช้ Container นี้เสร็จ ก็จะลบ Container ทิ้งไป
`````````````````````````````````````````````````````````````````````````````````````````````````
-v → Bind mount a volume (map volume local กับ docker)

v1 = path volume at local

v2 = path volume at docker

-w → Directory ที่จะใช้งานใน Docker

gcrobot:qa → ชื่อและTag ของ Docker Image ที่เราจะเอามาสร้างและรัน


`````````````````````````````````````````````````````````````````````````````````````````````````
Result image in Docker
> run_indocker.png