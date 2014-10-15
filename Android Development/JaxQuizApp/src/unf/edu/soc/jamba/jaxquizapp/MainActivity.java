package unf.edu.soc.jamba.jaxquizapp;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;


public class MainActivity extends ActionBarActivity {
	private TextView mQuestionTV;
	private TextView mAnswerTV;
	private int mCurrentIndex = 0;
	private int[] mQuestionBank = new int[] {
	R.string.question_text1, R.string.question_text2, 
	R.string.question_text3};
	private boolean[] mAnswerBank = new boolean[] {true, false, 
	true};
	private Button mTrueButton;
	private Button mFalseButton;
	private Button mNextButton;
	private Boolean answer;
    private Boolean correctAnswer;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
       mQuestionTV = (TextView)findViewById(R.id.question_textView);
        mQuestionTV.setText(R.string.question_text1);
        mAnswerTV = (TextView)findViewById(R.id.answer_textView);
        
        mTrueButton = (Button) findViewById(R.id.true_button);
        mTrueButton.setOnClickListener(new View.OnClickListener() {
        	
        @Override
        public void onClick(View v) {
         	answer = true;
        	correctAnswer = mAnswerBank[mCurrentIndex];
        	if(answer == correctAnswer){
        		mAnswerTV.setText(R.string.correct_text);
        	}else{
        		mAnswerTV.setText(R.string.incorrect_text);
        	}
        }
        });
        mFalseButton = (Button) findViewById(R.id.false_button);
        mFalseButton.setOnClickListener(new View.OnClickListener() {
      

		@Override
        public void onClick(View v) {
        	answer = false;
        	correctAnswer = mAnswerBank[mCurrentIndex];
        	if(answer == correctAnswer){
        		mAnswerTV.setText(R.string.correct_text);
        	}else{
        		mAnswerTV.setText(R.string.incorrect_text);
        	}
        }
        });
        mNextButton = (Button) findViewById(R.id.next_button);
        mNextButton.setOnClickListener(new View.OnClickListener() 
        {
        @Override
        public void onClick(View v) 
            {
        	mCurrentIndex++;
        	if(mCurrentIndex == mQuestionBank.length)
        	{
        		mCurrentIndex = 0;
        	}
        	if(mCurrentIndex==0){
        		mQuestionTV.setText(R.string.question_text1);
        		}else if(mCurrentIndex ==1){
        			mQuestionTV.setText(R.string.question_text2);
        		}else if(mCurrentIndex ==2){
        			mQuestionTV.setText(R.string.question_text3);
        		}
        	mQuestionTV = (TextView)findViewById(R.id.question_textView);
        	}
        
        	});
        
            };


    
    @Override
	public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

  
    @Override
	public boolean onOptionsItemSelected(MenuItem item) 
    {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings)
        {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
      
        }
