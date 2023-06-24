//importing necessary libraries

import android.content.Context
import android.view.View
import android.widget.TextView
import android.widget.Toast

//creating the class CommunityCompassion 

class CommunityCompassion {

//declaring the variables
 
 private var context: Context? = null
 private var titleView: TextView? = null
 private var contentView: TextView? = null

//creating the constructor of the class
 
 constructor(context: Context, titleView: TextView, contentView: TextView) {
  this.context = context
  this.titleView = titleView
  this.contentView = contentView
 }
 
 //function to display the title

 fun displayTitle(title: String) {
  titleView?.text = title
  Toast.makeText(context, "Title displayed successfully", Toast.LENGTH_SHORT).show()
 }
 
 //function to display the content
 
 fun displayContent(content: String) {
  contentView?.text = content
  Toast.makeText(context, "Content displayed successfully", Toast.LENGTH_SHORT).show()
 }
 
 //function to display the message
 
 fun displayMessage(message: String) {
  Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
 }
 
 //function to save the data
 
 fun saveData() {
  Toast.makeText(context, "Data saved successfully", Toast.LENGTH_SHORT).show()
 }
 
 //function to show the view
 
 fun showView() {
  contentView?.visibility = View.VISIBLE
  Toast.makeText(context, "View shown successfully", Toast.LENGTH_SHORT).show()
 }
 
 //function to hide the view
 
 fun hideView() {
  contentView?.visibility = View.GONE
  Toast.makeText(context, "View hidden successfully", Toast.LENGTH_SHORT).show()
 }
}