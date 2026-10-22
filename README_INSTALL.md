# NAT Panel 部署

运行 PHP 8.2、MySQL/MariaDB。网站根目录指定为项目 `public/`。
PHP 扩展需有 PDO MySQL、mbstring、curl、zip、gd、openssl。
创建数据库后访问站点安装向导，在项目根目录生成 `.env` 和 `install.lock`。

Docker：复制 `.compose.env.example` 为 `.compose.env`，设置随机密码后：
```bash
docker compose --env-file .compose.env up -d --build
```
Web 仅绑定到宿主机 `127.0.0.1:8082`；生产访问需要 HTTPS 反向代理。
在向导填写数据库主机 `db`、数据库 `natcloud`、用户 `natcloud` 及设置的应用密码。
定时运行 `cron/bill.php` 与 `cron/traffic_reset.php`。
不要用本配置直接部署生产支付或实名系统。
