package unf.edu.jambaaddressbook;



import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.content.DialogInterface;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class DetailsFragment extends Fragment
{
   
   public interface DetailsFragmentListener
   {
      
      public void onContactDeleted();
      
      
      public void onEditContact(Bundle arguments);
   }
   
   private DetailsFragmentListener listener;
   
   private long rowID = -1; 
   private TextView nameTextView; 
   private TextView phoneTextView; 
   private TextView emailTextView; 
   private TextView streetTextView; 
   private TextView cityStateTextView; // city, state, zip code  
   
   
   @Override
   public void onAttach(Activity activity)
   {
      super.onAttach(activity);
      listener = (DetailsFragmentListener) activity;
   }
   
   
   @Override
   public void onDetach()
   {
      super.onDetach();
      listener = null;
   }

   
   @Override
   public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState)
   {
      super.onCreateView(inflater, container, savedInstanceState);  
      setRetainInstance(true); 
      
      if (savedInstanceState != null) 
         rowID = savedInstanceState.getLong(MainActivity.ROW_ID);
      else 
      {
         
         Bundle contactID = getArguments(); 
         
         if (contactID != null)
            rowID = contactID.getLong(MainActivity.ROW_ID);
      }
         
      View view = 
         inflater.inflate(R.layout.fragment_details, container, false);               
      setHasOptionsMenu(true); 

      
      nameTextView = (TextView) view.findViewById(R.id.nameTextView);
      phoneTextView = (TextView) view.findViewById(R.id.phoneTextView);
      emailTextView = (TextView) view.findViewById(R.id.emailTextView);
      streetTextView = (TextView) view.findViewById(R.id.streetTextView);
      cityStateTextView = (TextView) view.findViewById(R.id.cityStateTextView);
      return view;
   }
   
  
   @Override
   public void onResume()
   {
      super.onResume();
      new LoadContact().execute(rowID); // load contact at rowID
   } 

   
   @Override
   public void onSaveInstanceState(Bundle outState) 
   {
       super.onSaveInstanceState(outState);
       outState.putLong(MainActivity.ROW_ID, rowID);
   }

   
   @Override
   public void onCreateOptionsMenu(Menu menu, MenuInflater inflater)
   {
      super.onCreateOptionsMenu(menu, inflater);
      inflater.inflate(R.menu.fragment_details_menu, menu);
   }

   
   @Override
   public boolean onOptionsItemSelected(MenuItem item) 
   {
      switch (item.getItemId())
      {
         case R.id.action_edit: 
            
            Bundle info = new Bundle();
            info.putLong(MainActivity.ROW_ID, rowID);
            info.putCharSequence("name", nameTextView.getText());
            info.putCharSequence("phone", phoneTextView.getText());
            info.putCharSequence("email", emailTextView.getText());
            info.putCharSequence("street", streetTextView.getText());
            info.putCharSequence("city", cityStateTextView.getText());           
            listener.onEditContact(info); 
            return true;
         case R.id.action_delete:
            deleteContact();
            return true;
      }
      
      return super.onOptionsItemSelected(item);
   } 
   
   
   private class LoadContact extends AsyncTask<Long, Object, Cursor> 
   {
      DatabaseConnector dbConnector = 
         new DatabaseConnector(getActivity());

      
      @Override
      protected Cursor doInBackground(Long... params)
      {
         dbConnector.open();
         return dbConnector.getOneContact(params[0]);
      } 

      
      @Override
      protected void onPostExecute(Cursor result)
      {
         super.onPostExecute(result);
         result.moveToFirst(); // move to the first item 
   
         
         int nameIndex = result.getColumnIndex("name");
         int phoneIndex = result.getColumnIndex("phone");
         int emailIndex = result.getColumnIndex("email");
         int streetIndex = result.getColumnIndex("street");
         int cityStatIndex = result.getColumnIndex("city");
         
   
         
         nameTextView.setText(result.getString(nameIndex));
         phoneTextView.setText(result.getString(phoneIndex));
         emailTextView.setText(result.getString(emailIndex));
         streetTextView.setText(result.getString(streetIndex));
         cityStateTextView.setText(result.getString(cityStatIndex));
         
   
         result.close(); 
         dbConnector.close(); 
      } 
   } 

   
   private void deleteContact()
   {         
      
      confirmDelete.show(getFragmentManager(), "confirm delete");
   } 

   
   private DialogFragment confirmDelete = 
      new DialogFragment()
      {
         
         @Override
         public Dialog onCreateDialog(Bundle bundle)
         {
            
            AlertDialog.Builder builder = 
               new AlertDialog.Builder(getActivity());
      
            builder.setTitle(R.string.confirm_title); 
            builder.setMessage(R.string.confirm_message);
      
            
            builder.setPositiveButton(R.string.button_delete,
               new DialogInterface.OnClickListener()
               {
                  @Override
                  public void onClick(
                     DialogInterface dialog, int button)
                  {
                     final DatabaseConnector databaseConnector = 
                        new DatabaseConnector(getActivity());
      
                     
                     AsyncTask<Long, Object, Object> deleteTask =
                        new AsyncTask<Long, Object, Object>()
                        {
                           @Override
                           protected Object doInBackground(Long... params)
                           {
                              databaseConnector.deleteContact(params[0]); 
                              return null;
                           } 
      
                           @Override
                           protected void onPostExecute(Object result)
                           {                                 
                              listener.onContactDeleted();
                           }
                        }; 
                     
                     deleteTask.execute(new Long[] { rowID });               
                  } 
               } 
            ); 
            
            builder.setNegativeButton(R.string.button_cancel, null);
            return builder.create(); 
         }
      }; 
} 

