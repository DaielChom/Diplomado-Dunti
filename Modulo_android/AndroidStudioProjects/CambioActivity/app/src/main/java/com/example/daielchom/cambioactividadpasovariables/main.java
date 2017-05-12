package com.example.daielchom.cambioactividadpasovariables;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class main extends AppCompatActivity {

    private Button btIngreso;
    private Button btEgreso;
    private TextView lbMonto;
    private String param;
    private int monto;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        btIngreso = (Button) findViewById(R.id.btIngreso);
        btEgreso = (Button) findViewById(R.id.btEgreso);
        lbMonto = (TextView) findViewById(R.id.textView);
        monto = Integer.parseInt(lbMonto.getText().toString());
    }

    public void func_main_to_acIngreso(View v){

        //Se inicializan los Intent, los cuales se encargan del cambio de activity y
        // tambien del paso de parametros entre las mismas
        Intent send_params = new Intent(main.this, acIngresoEgreso.class); // Intent envio de parametro

        // Verifica quien realizo la accion y envia el mensaje
        if(v.getId() == btIngreso.getId()){
            send_params.putExtra("parametro", btIngreso.getText().toString());
        }

        else if(v.getId() == btEgreso.getId()){
            send_params.putExtra("parametro", btEgreso.getText().toString());
        }

        // Activa los intent
        startActivityForResult(send_params,0);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 0 && resultCode == RESULT_OK){
            if(data.getStringExtra("indicador").equals(btIngreso.getText().toString())){
                monto += Integer.parseInt(data.getStringExtra("monto"));
            }
            if(data.getStringExtra("indicador").equals(btEgreso.getText().toString())){
                monto -= Integer.parseInt(data.getStringExtra("monto"));
            }
        }

        lbMonto.setText(String.valueOf(monto));
        }

    }
