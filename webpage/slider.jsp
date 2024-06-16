<%@ page import="java.io.*, org.json.simple.JSONArray, org.json.simple.parser.JSONParser" %>
<%
// Initialize variables
JSONArray slides = new JSONArray();

try {
    // Read the JSON file
    InputStream inputStream = new FileInputStream(new File("slider.json"));
    InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
    BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
    StringBuilder stringBuilder = new StringBuilder();
    String line;
    while ((line = bufferedReader.readLine()) != null) {
        stringBuilder.append(line);
    }
    bufferedReader.close();
    inputStreamReader.close();
    inputStream.close();

    // Parse the JSON data
    JSONParser parser = new JSONParser();
    slides = (JSONArray) parser.parse(stringBuilder.toString());
} catch (IOException | org.json.simple.parser.ParseException e) {
    e.printStackTrace();
}

// Output the JSON array
out.println(slides);
%>
