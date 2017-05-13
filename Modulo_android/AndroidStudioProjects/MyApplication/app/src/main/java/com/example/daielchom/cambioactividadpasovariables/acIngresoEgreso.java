package com.example.daielchom.cambioactividadpasovariables;

import android.support.design.widget.Snackbar;
import android.content.Intent;
import android.support.v4.text.TextUtilsCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;


import org.w3c.dom.Text;

public class acIngresoEgreso extends AppCompatActivity {

    private String textButton;
    private TextView lbTitulo;
    private Button btAgregar;
    private EditText txMonto;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ac_ingreso_egreso);

        textButton = getIntent().getStringExtra("parametro");
        lbTitulo = (TextView) findViewById(R.id.lbTitulo);
        btAgregar = (Button) findViewById(R.id.btAgregar);
        txMonto = (EditText) findViewById(R.id.txMonto);

        lbTitulo.setText(textButton);
    }

    public void agregar_to_Monto(View view) {
        Intent datos = new Intent();
        if (TextUtils.isEmpty(txMonto.getText().toString())) {
            Snackbar.make(view, "" + "Ingrese un monto", Snackbar.LENGTH_LONG).show();

        } else {
            datos.putExtra("monto", txMonto.getText().toString());
            datos.putExtra("indicador", textButton);
            setResult(RESULT_OK, datos);
            finish();
        }


    }
}
