<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hieuduong
  Date: 11/12/17
  Time: 11:31 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Calculate sum of ArrayList values</title>
  <script>
      function validateForm(){
          var val1 = document.forms["myForm"]["value1"].value;
          if(val1 == ""){
              alert("Value 1 is required!");
              document.forms["myForm"]["value1"].focus();
              return false;
          }

          var val2 = document.forms["myForm"]["value2"].value;
          if(val2 == ""){
              alert("Value 2 is required!");
              document.forms["myForm"]["value2"].focus();
              return false;
          }

          var val3 = document.forms["myForm"]["value3"].value;
          if(val3 == ""){
              alert("Value 3 is required!");
              document.forms["myForm"]["value3"].focus();
              return false;
          }

          var val4 = document.forms["myForm"]["value4"].value;
          if(val4 == ""){
              alert("Value 4 is required!");
              document.forms["myForm"]["value4"].focus();
              return false;
          }

          var val5 = document.forms["myForm"]["value5"].value;
          if(val5 == ""){
              alert("Value 5 is required!");
              document.forms["myForm"]["value5"].focus();
              return false;
          }
      }
  </script>
</head>
<body>
<br>
/**<br>
* Hieu Duong<br>
* CSC201<br>
* Assignment 11<br>
* Problem 11.2:<br>
*<br>
*  (Sort ArrayList) Write the following method that sorts an ArrayList of numbers. <br>
*  public static void sort(ArrayList<Number> list) <br>
  *<br>
  * 10/21/2017<br>
  *<br>
  */<br>
  <br>
  <form name="myForm" action="index.jsp" method="post" onsubmit="return validateForm()">
    <table align="center" style="width: 400px;">
      <tr>
        <td style="width: 150px; text-align: left;">
          Value1:
        </td>
        <td>
          <input type="text" value="" id="1" name="value1">
        </td>
      </tr>
      <tr>
        <td style="width: 150px; text-align: left;">
          Value2:
        </td>
        <td>
          <input type="text" value="" id="2" name="value2">
        </td>
      </tr>
      <tr>
        <td style="width: 150px; text-align: left;">
          Value3:
        </td>
        <td>
          <input type="text" value="" id="3" name="value3">
        </td>
      </tr>
      <tr>
        <td style="width: 150px; text-align: left;">
          Value4:
        </td>
        <td>
          <input type="text" value="" id="4" name="value4">
        </td>
      </tr>
      <tr>
        <td style="width: 150px; text-align: left;">
          Value5:
        </td>
        <td>
          <input type="text" value="" id="5" name="value5">
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align: center">
          <input type="submit" value="Submit">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>


<%
  class Data{
    public Data(){

    }

    /**
     * Display array list
     * @param list
     * @return
     */
    private String displayList(ArrayList<Integer> list) {
      String arrayList = "";
      for(int i=0; i < list.size(); i++){
        if(i==list.size()-1){
          arrayList+=list.get(i);
        }
        else{
          arrayList+=list.get(i)+",";
        }
      }
      return arrayList;
    }

    /**
     * Sort array list
     * @param list
     * @return
     */
    private ArrayList sortArray(ArrayList<Double> list) {

      for(int index =0; index < list.size(); index++){
        double currentMinVal = list.get(index);
        int currentIndex = index;

        for(int nextIndex = index+1; nextIndex<list.size(); nextIndex ++){
          if(currentMinVal > list.get(nextIndex)){
            currentMinVal = list.get(nextIndex);
            currentIndex = nextIndex;
          }
        }

        if(currentIndex != index){
          list.set(currentIndex, list.get(index));
          list.set(index, currentMinVal);
        }
      }
      return list;
    }
  }

  ArrayList<Double> list = new ArrayList<Double>();

  double value1 = 0.0;
  try{
    value1 = Double.parseDouble(request.getParameter("value1").toString());
    list.add(value1);
  }
  catch (Exception e){
    value1 = 0.0;
    out.print("Value 1 is invalid.");
  }

  double value2 = 0.0;
  try{
    value2 = Double.parseDouble(request.getParameter("value2").toString());
    list.add(value2);
  }
  catch (Exception e){
    value2 = 0.0;
    out.print("Value 2 is invalid.");
  }

  double value3 = 0.0;
  try{
    value3 = Double.parseDouble(request.getParameter("value3").toString());
    list.add(value3);
  }
  catch (Exception e){
    value3 = 0.0;
    out.print("Value 3 is invalid.");
  }

  double value4 = 0.0;
  try{
    value4 = Double.parseDouble(request.getParameter("value4").toString());
    list.add(value4);
  }
  catch (Exception e){
    value4 = 0.0;
    out.print("Value 4 is invalid.");
  }

  double value5 = 0.0;
  try{
    value5 = Double.parseDouble(request.getParameter("value5").toString());
    list.add(value5);
  }
  catch (Exception e){
    value5 = 0.0;
    out.print("Value 5 is invalid.");
  }

  Data data = new Data();
  StringBuilder sb = new StringBuilder();
  sb.append("<table style='width: 250px;' align='center'><tr><td>Result: "+data.displayList(data.sortArray(list))+"</td></tr></table>");
  out.print(sb);

%>
