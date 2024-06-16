<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quiz</title>
    <link rel="icon" type="image/x-icon" href="india.png">
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        .form-container {
            width: 50%;
            margin: 0 auto;
            text-align: left;
            padding: 20px;
            background-color: #f8f8f8;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <header>
        <h1>Test Yourself !!</h1>
    </header>
    <h1 style="text-align:center;">Quiz</h1>
    <div class="form-container">
        <form action="result.jsp" method="post">
            <p>1. What is the festival of lights celebrated in India?<br>
                <input type="radio" name="q1" value="a"> a) Eid<br>
                <input type="radio" name="q1" value="b"> b) Christmas<br>
                <input type="radio" name="q1" value="c"> c) Diwali<br>
                <input type="radio" name="q1" value="d"> d) Holi<br>
            </p>
            <p>2.Which classical dance form originated in the state of Kerala?<br>
                <input type="radio" name="q2" value="a"> a) Bharatanatyam<br>
                <input type="radio" name="q2" value="b"> b) Kathakali<br>
                <input type="radio" name="q2" value="c"> c) Kuchipudi<br>
                <input type="radio" name="q2" value="d"> d) Odissi<br>
            </p>
            <p>3. Which ancient Indian text is considered the foundation of Hindu philosophy and spirituality?<br>
                <input type="radio" name="q3" value="a"> a) Ramayana<br>
                <input type="radio" name="q3" value="b"> b) Mahabharata<br>
                <input type="radio" name="q3" value="c"> c) Upanishads<br>
                <input type="radio" name="q3" value="d"> d) Bhagavad Gita<br>

            </p>
            <p>4. Which Indian festival marks the victory of good over evil and is celebrated with the burning of effigies of the demon king Ravana?<br>
                <input type="radio" name="q4" value="a"> a) Navratri<br>
                <input type="radio" name="q4" value="b"> b) Holi<br>
                <input type="radio" name="q4" value="c"> c) Dussehra<br>
                <input type="radio" name="q4" value="d"> d) Diwali<br>
            </p>
            <p>5. What is the name of the Indian classical music instrument known for its long neck and resonating gourd?<br>
                <input type="radio" name="q5" value="a"> a) Sitar<br>
                <input type="radio" name="q5" value="b"> b) Tabla<br>
                <input type="radio" name="q5" value="c"> c) Sarod<br>
                <input type="radio" name="q5" value="d"> d) Flute<br>

            </p>
            <p>6. What is the traditional Indian system of medicine that emphasizes a holistic approach to healthcare?<br>
                <input type="radio" name="q6" value="a"> a) Homeopathy<br>
                <input type="radio" name="q6" value="b"> b) Allopathy<br>
                <input type="radio" name="q6" value="c"> c) Naturopathy<br>
                <input type="radio" name="q6" value="d"> d) Ayurveda<br>
            <input type="submit" value="Submit" style="color:white;background-color:black;">
        </form>
    </div>
</body>
</html>