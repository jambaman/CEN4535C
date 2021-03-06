package unf.edu.jambaaddressbook;

import android.app.Activity;
import android.app.FragmentTransaction;
import android.os.Bundle;



public class MainActivity extends Activity 
implements ContactListFragment.ContactListFragmentListener,
   DetailsFragment.DetailsFragmentListener, 
   AddEditFragment.ModifyFragmentListener
{

public static final String ROW_ID = "row_id"; 

ContactListFragment contactListFragment; 


@Override
protected void onCreate(Bundle savedInstanceState)
{
   super.onCreate(savedInstanceState);
   setContentView(R.layout.activity_main);

   
   if (savedInstanceState != null) 
      return;

   if (findViewById(R.id.fragmentContainer) != null) 
   {
     
      contactListFragment = new ContactListFragment();
      
      FragmentTransaction transaction = 
         getFragmentManager().beginTransaction();
      transaction.add(R.id.fragmentContainer, contactListFragment);
      transaction.commit(); 
   }
}


@Override
protected void onResume()
{
   super.onResume();
   
   
}


@Override
public void onContactSelected(long rowID)
{
   displayContact(rowID, R.id.fragmentContainer);   
}


private void displayContact(long rowID, int viewID)
{
   DetailsFragment detailsFragment = new DetailsFragment();
   
   
   Bundle arguments = new Bundle();
   arguments.putLong(ROW_ID, rowID);
   detailsFragment.setArguments(arguments);
   
   
   FragmentTransaction transaction = 
      getFragmentManager().beginTransaction();
   transaction.replace(viewID, detailsFragment);
   transaction.addToBackStack(null);
   transaction.commit(); 
}


@Override
public void onAddContact()
{
   if (findViewById(R.id.fragmentContainer) != null)
      displayAddEditFragment(R.id.fragmentContainer, null); 

}

private void displayAddEditFragment(int viewID, Bundle arguments)
{
   AddEditFragment addEditFragment = new AddEditFragment();
   
   if (arguments != null) 
      addEditFragment.setArguments(arguments);
   
   
   FragmentTransaction transaction = 
      getFragmentManager().beginTransaction();
   transaction.replace(viewID, addEditFragment);
   transaction.addToBackStack(null);
   transaction.commit(); 
}

@Override
public void onContactDeleted()
{
   getFragmentManager().popBackStack(); 
   
}

@Override
public void onEditContact(Bundle arguments)
{
 
      displayAddEditFragment(R.id.fragmentContainer, arguments); 

}

@Override
public void onAddEditFinish(long rowID)
{
   getFragmentManager().popBackStack();
   getFragmentManager().popBackStack();
   contactListFragment.updateContactList();

}   
}

