<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PharmaSoft - Login</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #58bc82;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form {
            --bg-light: #efefef;
            --bg-dark: #707070;
            --clr: #58bc82;
            --clr-alpha: #9c9c9c60;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
            width: 100%;
            max-width: 300px;
            background: white;
            padding: 3rem;
            border-radius: 10px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
        }

        .form .input-span {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form input[type="text"],
        .form input[type="password"] {
            border-radius: 0.5rem;
            padding: 1rem 0.75rem;
            width: 100%;
            border: none;
            background-color: var(--clr-alpha);
            outline: 2px solid var(--bg-dark);
        }

        .form input[type="text"]:focus,
        .form input[type="password"]:focus {
            outline: 2px solid var(--clr);
        }

        .label {
            align-self: flex-start;
            color: var(--clr);
            font-weight: 600;
        }

        .form .submit {
            padding: 1rem 0.75rem;
            width: 100%;
            border-radius: 3rem;
            background-color: var(--bg-dark);
            color: var(--bg-light);
            border: none;
            cursor: pointer;
            transition: all 300ms;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .form .submit:hover {
            background-color: var(--clr);
            color: var(--bg-dark);
        }

        .span {
            text-decoration: none;
            color: var(--bg-dark);
        }

        .span a {
            color: var(--clr);
        }

	.register-btn {
    	display: block;
    	width: 100%;
    	max-width: 300px;
    	text-align: center;
    	padding: 1rem;
    	border-radius: 3rem;
    	background-color: var(--bg-dark); /* Green color */
    	color: var(--bg-light);
    	font-weight: 600;
    	text-decoration: none;
    	transition: all 300ms;
    	margin-top: 15px;
    	font-size: 16px;
		}

        .register-btn:hover {
            background-color: var(--clr);
            color: var(--bg-light);
        }
    </style>
</head>
<body>

    <h1>PharmaSoft Registration Page</h1>

    <form class="form" action="loginServlet" method="post">
        <span class="input-span">
            <label for="username" class="label">Username</label>
            <input type="text" name="username" id="username" required aria-label="Enter your Username"/>
        </span>
        <span class="input-span">
            <label for="password" class="label">Password</label>
            <input type="password" name="password" id="password" required aria-label="Enter your password"/>
        </span>
        <input class="submit" type="submit" value="Register" />
    </form>

    <a href="index.html" class="register-btn">Already have Account?</a>

</body>
</html>
