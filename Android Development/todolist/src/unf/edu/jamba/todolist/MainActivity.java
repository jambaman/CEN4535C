package unf.edu.jamba.todolist;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONTokener;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;


public class MainActivity extends Activity {
	private ArrayList<String> todoItems = new ArrayList<String>();
	private ArrayAdapter<String> aa;
	private String mFilename = "testFile.json";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        readToDoItems();
        aa = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, 
        		 todoItems);
        		 ListView mListView = (ListView) findViewById(R.id.list_view);
        		 mListView.setAdapter(aa);
        		 
        		 final EditText mEditText = (EditText) findViewById(R.id.add_item_text);
        		 mEditText.setOnKeyListener(new View.OnKeyListener() {
        		 @Override
        		 public boolean onKey(View v, int keyCode, KeyEvent event) {
        		 if(event.getAction() == KeyEvent.ACTION_DOWN) 
        		 if((keyCode == KeyEvent.KEYCODE_DPAD_CENTER) ||
        		  (keyCode == KeyEvent.KEYCODE_ENTER)) {
        		  todoItems.add(0, mEditText.getText().toString());
        		  aa.notifyDataSetChanged();
        		  mEditText.setText("");
        		  return true;
        		 }
        		 return false;
        		 }
        		 });
        		 registerForContextMenu(mListView);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, 
    ContextMenu.ContextMenuInfo menuInfo) {
    getMenuInflater().inflate(R.menu.list_item_context, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
    private void saveToDoItems() {
    	JSONArray array = new JSONArray(todoItems);
    	Writer writer = null;
    	try {
    	 OutputStream out = openFileOutput(mFilename, Context.MODE_PRIVATE);
    	 writer = new OutputStreamWriter(out);
    	 writer.write(array.toString());
    	 writer.close();
    	} catch(IOException e) {
    	Log.d("Writer", "IO exception:", e);
    	}
    	}
    @Override
    public void onPause() {
    super.onPause();
    saveToDoItems();
    }
    private void readToDoItems() {
    	BufferedReader reader = null;
    	try {
    	InputStream in = openFileInput(mFilename);
    	reader = new BufferedReader(new InputStreamReader(in));
    	StringBuilder jsonString = new StringBuilder();
    	String line = null;
    	while((line = reader.readLine())!= null) {
    	jsonString.append(line);
    	}JSONArray array = (JSONArray) new
    	 JSONTokener(jsonString.toString()).nextValue();
    	for(int i = 0; i < array.length(); i++) 
    	todoItems.add(array.getString(i));
    	reader.close();
    	} catch(IOException e) {
    	Log.d("Reader", "IO exception:", e);
    	} catch (JSONException e) {
    	// TODO Auto-generated catch block
    	e.printStackTrace();
    	}
    	}
    	 
    @Override
    public boolean onContextItemSelected(MenuItem item) {
     AdapterContextMenuInfo info = (AdapterContextMenuInfo) item.getMenuInfo();
     int position = info.position;
    switch(item.getItemId()) {
    case R.id.menu_item_delete:
    todoItems.remove(position);
    aa.notifyDataSetChanged();
    return true;
    }
    return super.onContextItemSelected(item);
    } 
}
