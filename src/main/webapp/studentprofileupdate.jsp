<!DOCTYPE html>
<%@page import="com.klef.jfsd.springboot.model.Student"%>
<html lang="en">

<%
    Student s = (Student) session.getAttribute("student");

    if(s==null)
    {
        response.sendRedirect("sessionexpiry");
        return;
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <link rel="stylesheet" href="./css/studentsidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
    @charset "UTF-8";

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'poppins', sans-serif;
}

body {
    font-family: 'Poppins', sans-serif;
    display: flex;
    height: 100vh;
    background-color: #f5f5f5;
    overflow-x: hidden;
    position: relative;
}

/* Menu Icon (Hamburger) */
.menu-icon {
    position: fixed;
    top: 20px;
    left: 20px;
    font-size: 30px;
    cursor: pointer;
    color: gray;
    z-index: 1000; /* Ensure icon is on top */
}

/* Sidebar Styles */
.sidebar {
    width: 290px;
    background-color: #2f335a;
    padding: 20px;
    color: white;
    position: fixed;
    left: -290px; /* Initially hidden */
    top: 0;
    height: 100%;
    transition: left 0.3s ease;
    z-index: 900; /* Above content */
    overflow-y: auto; /* Scroll if content exceeds */
}

.sidebar.active {
    left: 0;
}

.sidebar-header {
    margin-bottom: 20px;
    font-family: 'Poppins', sans-serif;
}

.sidebar h2 {
    font-size: 22px;
    color: #ffffff;
    font-family: 'Poppins', sans-serif;
}

.sidebar ul {
    list-style: none;
}

.sidebar ul li {
    margin-bottom: 15px;
}

.sidebar ul li a {
    color: #eaeaea;
    text-decoration: none;
    font-size: 16px;
    display: flex;
    align-items: center;
    padding: 10px;
    border-radius: 5px;
    transition: background 0.3s, color 0.3s;
    font-family: 'Poppins', sans-serif;
}

.sidebar ul li a:hover {
    background-color: #7f8996;
    color: #ffffff;
}

.sidebar ul li a i {
    margin-right: 10px;
}

/* Dropdown Arrow Styling */
.arrow {
    margin-left: auto;
    transition: transform 0.3s ease;
}

/* Dropdown Styles */
.dropdown-content {
    display: none;
    list-style: none;
    padding-left: 20px;
    background-color: #7f8996;
    margin-top: 10px;
    border-radius: 5px;
    overflow: hidden;
    max-height: 0;
    transition: max-height 0.3s ease-in-out;
    font-family: 'Poppins', sans-serif;
}

.dropdown-content li {
    margin: 5px 0;
    font-family: 'Poppins', sans-serif;
}

.dropdown-content li a {
    color: #eaeaea;
    text-decoration: none;
    font-size: 14px;
    display: flex;
    align-items: center;
    padding: 8px 15px;
    border-radius: 5px;
    transition: background 0.3s;
    font-family: 'Poppins', sans-serif;
}

.dropdown-content li a:hover {
    background-color: #0112AC;
}

.show {
    display: block;
    max-height: 300px;
}

/* Main Content Styles */
.container {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    transition: margin-left 0.3s ease;
    margin-left: 0;
}

.sidebar.active ~ .container {
    margin-left: 250px; /* Adjust for sidebar */
}

.main-content {
    padding: 20px;
    margin-left: 290px; /* Reserve space for sidebar */
    margin-top: 50px; /* Space for header */
    transition: margin-left 0.3s ease;
    flex-grow: 1;
    background-color: #ecf0f1;
    border-radius: 10px;
}

/* Adjustments for when the sidebar is active */
.sidebar.active ~ .main-content {
    margin-left: 0;
}

/* Header Styles */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #ffffff;
    padding: 10px 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    border-radius: 10px;
}

header h1 {
    font-size: 24px;
    color: #2c3e50;
    font-family: 'Poppins', sans-serif;
}

.user-info {
    display: flex;
    align-items: center;
    font-family: 'Poppins', sans-serif;
}

.user-info span {
    margin-right: 20px;
    font-size: 18px;
    font-family: 'Poppins', sans-serif;
}

.logout-btn {
    padding: 8px 16px;
    background-color: #e74c3c;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-family: 'Poppins', sans-serif;
}

.logout-btn:hover {
    background-color: #c0392b;
}

/* Dashboard Cards */
.dashboard-cards {
    display: flex;
    flex-direction: column; /* Stack cards vertically */
    justify-content: center;
    gap: 15px; /* Reduced gap between cards */
    margin-top: 20px;
    font-family: 'Poppins', sans-serif;
}

.card {
    background-color: #7f8996;
    padding: 10px; /* Reduced padding */
    border-radius: 8px; /* Slightly smaller border radius */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15); /* Lighter shadow */
    text-align: center;
    flex: 1;
    min-width: 150px; /* Reduced minimum width */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for hover effects */
}

.card:hover {
    transform: translateY(-4px); /* Slight lift effect on hover */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Slightly enhanced shadow on hover */
}

.card h3 {
    font-size: 14px; /* Reduced font size */
    margin-bottom: 6px; /* Reduced margin */
    color: #ffffff; /* Improved text color */
}

.card p {
    font-size: 20px; /* Reduced font size */
    font-weight: bold;
    color: #ffffff; /* Improved text color */
}

/* Button Styles */
.primary-btn, .secondary-btn {
    padding: 8px 16px; /* Reduced padding */
    font-size: 14px; /* Reduced font size */
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.primary-btn {
    background-color: #ffffff;
    color: #0112AC;
    border: 1px solid #0112AC;
}

.primary-btn:hover {
    background-color: #e0e0e0;
}

.secondary-btn {
    background-color: #f0f0f0;
    color: #0112AC;
    border: 1px solid #b0b0b0;
}

.secondary-btn:hover {
    background-color: #c1c1c1;
}

/* Media Queries for Responsiveness */
@media screen and (max-width: 768px) {
    .sidebar {
        width: 100%;
        left: -100%;
    }

    .sidebar.active {
        left: 0;
    }

    .container, .main-content {
        margin-left: 0;
    }

    .dashboard-cards {
        flex-direction: column; /* Ensure cards stack vertically on small screens */
        gap: 10px; /* Reduced gap for small screens */
    }

    .card {
        min-width: unset; /* Remove minimum width for smaller screens */
    }
}

/* General styles */
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: 'Poppins', sans-serif;
    background-color: #f4f6f9;
    font-family: 'Poppins', sans-serif;
}

.login-page {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: #f4f6f9;
}

.login-box {
    background-color: white;
    padding: 40px;
    width: 400px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.logo h1 {
    font-size: 2em;
    color: #0112AC; /* Primary color */
    margin-bottom: 40px;
}

.input-group {
    margin-bottom: 20px;
    text-align: left;
}

.input-group label {
    font-weight: 600;
    font-size: 0.9em;
    color: #333;
}

.input-group input {
    width: 100%;
    padding: 12px 15px;
    font-size: 1em;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f7f9fc;
}

.input-group input:focus {
    border-color: #0112AC;
    outline: none;
    background-color: #fff;
}

.login-btn {
    width: 100%;
    padding: 15px;
    font-size: 1em;
    background-color: #0112AC;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 600;
}

.login-btn:hover {
    background-color: #0b5ed7;
}

.login-box form {
    width: 100%;
}

/* Admin Login  */


    
        .profile-form-container {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        .profile-form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.3);
        }

        .submit-btn {
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .profile-form {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Container -->
    <div class="sidebar-container">
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleSidebar()"></i>
        </div>

        <div class="sidebar">
            <div class="sidebar-header"><br><br>
                <h2>Hello <%= s.getId() %></h2>
            </div>
            <ul>
                <li><a href="studentdashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="applyjobs"><i class="fas fa-briefcase"></i> Apply for jobs</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn" onclick="toggleDropdown('students')">
                        <i class="fas fa-eye"></i> View
                        <span class="arrow">&#9662;</span>
                    </a>
                    <ul class="dropdown-content" id="students-dropdown">
                        <li><a href="viewappliedjobs"><i class="fas fa-tachometer-alt"></i> Applied Jobs</a></li>
                        <li><a href="getjobsinwatchlist"><i class="fas fa-bars"></i> Watchlist</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn" onclick="toggleDropdown('employers')">
                        <i class="fas fa-user-edit"></i> Profile
                        <span class="arrow">&#9662;</span>
                    </a>
                    <ul class="dropdown-content" id="employers-dropdown">
                        <li><a href="studentprofile"><i class="fas fa-user-circle"></i> Personal Details</a></li>
                        <li><a href="educationdetails"><i class="fas fa-id-card"></i> Academic Details</a></li>
                        <li><a href="studentdocuments"><i class="fas fa-file-pdf"></i> Documents Uploaded</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-content">
        <header>
            <h1>CareerStream</h1>
            <div class="user-info">
                <span><%= s.getName() %></span>
                <button class="logout-btn" onclick="window.location.href='studentlogout'">Logout</button>
            </div>
        </header>
        
        <div class="profile-form-container">
            <form class="profile-form" action="updatestudentprofile" method="post">
                <div class="form-group">
                    <label for="studentId">Student ID</label>
                    <input type="text" id="studentId" name="sid" value="<%= s.getId() %>" readonly>
                </div>
                
                <div class="form-group">
                    <label for="gender">Name</label>
                    <input type="text" id="name" name="sname" value="<%= s.getName()%>">
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <input type="text" id="gender" name="sgender" value="<%= s.getGender()%>">
                </div>

                <div class="form-group">
                    <label for="dob">Date of Birth</label>
                    <input type="date" id="dob" name="sdob" value="<%=s.getDob() %>">
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="saddress" value="<%= s.getAddress() %>">
                </div>

                <div class="form-group">
                    <label for="email">Email ID</label>
                    <input type="email" id="email" name="semail" value="<%= s.getEmail()%>" readonly>
                </div>
                
                <div class="form-group">
                    <label for="email">Password</label>
                    <input type="password" id="password" name="spwd" value="<%= s.getPassword() %>">
                </div>
                

                <div class="form-group">
                    <label for="contact">Contact Number</label>
                    <input type="text" id="contact" name="scontact" value="<%= s.getContact() %>">
                </div>

                <button type="submit" class="submit-btn">Update Profile</button>
            </form>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/javascript/studentdashboard.js"></script>
</body>
</html>