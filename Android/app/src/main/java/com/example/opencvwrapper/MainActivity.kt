package com.example.opencvwrapper

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.navigateUp
import androidx.navigation.ui.setupActionBarWithNavController
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.EditText
import android.widget.TextView
import androidx.core.widget.addTextChangedListener
import com.example.opencvwrapper.databinding.ActivityMainBinding
import com.dimabolsunov.opencvwrapperlib.NativeLib

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var inputArrView = findViewById<EditText>(R.id.array_input)
        var inputMpView = findViewById<EditText>(R.id.multiplier_input)
        var outputView = findViewById<TextView>(R.id.array_output)

        var watcher  = object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable?) {
                val arr : DoubleArray = inputArrView.text.split(' ').map { t : String -> t.toDoubleOrNull() ?: 0.0 }.toDoubleArray()
                val mp = inputMpView.text.trim().toString().toDoubleOrNull() ?: 1.0
                val lib = NativeLib()
                val res = lib.multiplyWithOpenCV(arr, mp)
                outputView.text = "result (received at: ${lib.getCurrentTime()}):  ${res.joinToString()}"

            }

        }
        inputArrView.addTextChangedListener(watcher)
        inputMpView.addTextChangedListener(watcher)
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        // Inflate the menu; this adds items to the action bar if it is present.
        menuInflater.inflate(R.menu.menu_main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        return when (item.itemId) {
            R.id.action_settings -> true
            else -> super.onOptionsItemSelected(item)
        }
    }
}