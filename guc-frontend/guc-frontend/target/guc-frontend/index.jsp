<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GUC Frontend</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
        }

        body{

            background:linear-gradient(135deg,#071B52,#1E3C72,#2A5298);
            min-height:100vh;

            display:flex;
            justify-content:center;
            align-items:center;

            color:white;
        }

        .card{

            width:900px;

            background:rgba(255,255,255,.08);

            backdrop-filter:blur(18px);

            border-radius:25px;

            padding:45px;

            text-align:center;

            box-shadow:0 20px 60px rgba(0,0,0,.45);

            border:1px solid rgba(255,255,255,.08);

        }

        /* ---------------- Logo ---------------- */

        .logo{

            display:flex;
            justify-content:center;
            align-items:center;
            gap:20px;
            margin-bottom:30px;

        }

        .logo-circle{

            width:90px;
            height:90px;

            border-radius:50%;

            background:linear-gradient(135deg,#00C6FF,#0072FF);

            display:flex;

            justify-content:center;

            align-items:center;

            font-size:48px;

            font-weight:bold;

            box-shadow:0 10px 25px rgba(0,0,0,.4);

            transition:.4s;
        }

        .logo-circle:hover{

            transform:rotate(12deg) scale(1.08);

        }

        .logo-text h1{

            font-size:60px;

            letter-spacing:4px;

            color:white;

        }

        .logo-text p{

            color:#7db8ff;

            font-size:22px;

            letter-spacing:2px;

        }

        /* ---------------- Badge ---------------- */

        .badge{

            display:inline-block;

            margin-top:20px;

            padding:12px 25px;

            background:#00C853;

            border-radius:40px;

            font-weight:bold;

            font-size:17px;

        }

        /* ---------------- Heading ---------------- */

        h2{

            margin-top:35px;

            font-size:48px;

        }

        .subtitle{

            margin-top:25px;

            font-size:21px;

            line-height:1.8;

            color:#f2f2f2;

        }

        /* ---------------- Tech Stack ---------------- */

        .tech{

            margin-top:35px;

            display:flex;

            justify-content:center;

            gap:15px;

            flex-wrap:wrap;

        }

        .tech span{

            background:rgba(255,255,255,.12);

            padding:12px 18px;

            border-radius:30px;

            transition:.3s;

            cursor:pointer;

        }

        .tech span:hover{

            background:#007BFF;

            transform:translateY(-4px);

        }

        /* ---------------- Information Cards ---------------- */

        .info{

            margin-top:45px;

            display:grid;

            grid-template-columns:repeat(2,1fr);

            gap:20px;

        }

        .box{

            background:rgba(255,255,255,.07);

            padding:25px;

            border-radius:18px;

            transition:.3s;

        }

        .box:hover{

            transform:translateY(-6px);

            background:rgba(255,255,255,.12);

        }

        .box h3{

            margin-bottom:12px;

            color:#4FC3F7;

        }

        /* ---------------- Buttons ---------------- */

        .buttons{

            margin-top:40px;

        }

        button{

            padding:15px 30px;

            margin:10px;

            border:none;

            border-radius:10px;

            cursor:pointer;

            font-size:17px;

            transition:.3s;

        }

        .primary{

            background:#1976D2;

            color:white;

        }

        .secondary{

            background:#43A047;

            color:white;

        }

        button:hover{

            transform:translateY(-4px);

            opacity:.9;

        }

        footer{

            margin-top:45px;

            color:#ddd;

            font-size:15px;

        }

    </style>

</head>

<body>

<div class="card">

    <div class="logo">

        <div class="logo-circle">
            G
        </div>

        <div class="logo-text">
            <h1>GUC</h1>
            <p>Java Platform</p>
        </div>

    </div>

    <div class="badge">
        ☕ Enterprise Java WAR Application
    </div>

    <h2>Welcome to GUC Frontend 🚀</h2>

    <p class="subtitle">

        This application is built by <strong>GUC</strong> as part of an
        End-to-End Java & DevOps learning project.

        <br><br>

        This project demonstrates Java Web Applications,
        Maven, WAR Packaging, Apache Tomcat,
        Shell Scripting, Docker, Docker Compose,
        Jenkins and CI/CD practices.

    </p>

    <div class="tech">

        <span>☕ Java</span>

        <span>📦 WAR</span>

        <span>📁 Maven</span>

        <span>🌐 JSP</span>

        <span>🐱 Git</span>

        <span>🐳 Docker</span>

        <span>⚙ Jenkins</span>

        <span>☁ Azure</span>

    </div>

    <div class="info">

        <div class="box">

            <h3>🕒 Server Time</h3>

            <p>

                <%= new java.util.Date() %>

            </p>

        </div>

        <div class="box">

            <h3>☕ Java Version</h3>

            <p>

                <%= System.getProperty("java.version") %>

            </p>

        </div>

        <div class="box">

            <h3>💻 Operating System</h3>

            <p>

                <%= System.getProperty("os.name") %>

            </p>

        </div>

        <div class="box">

            <h3>🌍 Host Name</h3>

            <p>

                <%= java.net.InetAddress.getLocalHost().getHostName() %>

            </p>

        </div>

    </div>

    <div class="buttons">

        <button class="primary"
                onclick="alert('Welcome to GUC Frontend 🚀')">

            Explore Frontend

        </button>

        <button class="secondary"
                onclick="window.location.reload()">

            Refresh

        </button>

    </div>

    <footer>

        Built with ❤️ by GUC

        <br><br>

        Java • Maven • JSP • Apache Tomcat • Docker • Jenkins • Azure

        <br><br>

        © 2026 GUC Java Platform

    </footer>

</div>

</body>

</html>