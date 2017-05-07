package com.example.daielchom.asistente_cuentas;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.support.design.widget.Snackbar;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;


public class Main extends AppCompatActivity {

    //Creacion de variables
    private EditText txCuenbta;
    private Button btAgregar;
    private RadioButton btIngreso;
    private RadioButton btEgreso;
    private RadioGroup bgMonto;
    private TextView lbValor;

    //Metodo pincipal se ejecuta cada vez que se abre la app
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Relacion entre los paquetes de la vista con las variables de la logica
        txCuenbta = (EditText) findViewById(R.id.txCuenta);
        btAgregar = (Button) findViewById(R.id.btAgregar);
        btIngreso = (RadioButton) findViewById(R.id.rbtIngreso);
        btEgreso = (RadioButton) findViewById(R.id.rbtEgreso);
        bgMonto = (RadioGroup) findViewById(R.id.bgMonto);
        lbValor = (TextView) findViewById(R.id.lbValor);

    }

    public void calcular(View view)
    {
        //Comprueba si el textField esta vacion
        if (TextUtils.isEmpty(txCuenbta.getText().toString())) {

            //Muestra la advertencia usando el componente snackbar
            Snackbar.make(view, "" + "Ingrese un monto", Snackbar.LENGTH_LONG).show();

            //Para salir de una vez del metodo y no hacer mas
            return;
        }

        //Toma los valores de la vista para su futuro procesamiento
        int txvalor = Integer.parseInt(txCuenbta.getText().toString());
        int monto = Integer.parseInt(lbValor.getText().toString());

        //Confirma si los radio button estan seleccionados
        if(bgMonto.getCheckedRadioButtonId()==btIngreso.getId()) {
            lbValor.setText(String.valueOf(txvalor+monto));
        }

        else if(bgMonto.getCheckedRadioButtonId()==btEgreso.getId()) {
            lbValor.setText(String.valueOf(monto-txvalor));
        }

        else{
            Snackbar.make(view, "Selecionar Ingreso o Egreso", Snackbar.LENGTH_LONG).show();
        }

        // Verifica el valor del monto para marcarlo con un valor ya sea rojo o verde
        if(Integer.parseInt(lbValor.getText().toString())>=0){
            lbValor.setTextColor(ContextCompat.getColor(this, R.color.colorPrimary));
        }
        else{
            lbValor.setTextColor(Color.RED);
        }
    }

}
