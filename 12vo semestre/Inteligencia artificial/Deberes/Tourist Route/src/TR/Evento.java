package TR;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.naming.CommunicationException;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.JTable;
import java.awt.Color;
import java.awt.Dimension;

import javax.swing.border.LineBorder;
import javax.swing.border.MatteBorder;
import javax.swing.ListSelectionModel;

public class Evento extends JFrame {

	private JPanel contentPane;
	private JTable table;
	private MotorController motorController;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Evento frame = new Evento();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}


	public Evento() {
		setTitle("Tourist Route - Artificial Intelligence - Event");
		setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		setBounds(100, 100, 489, 394);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);	
		
		
		JComboBox CBRutas = new JComboBox();
		CBRutas.removeAllItems();		
		CBRutas.setBounds(49, 56, 187, 20);
		contentPane.add(CBRutas);
		
		JLabel lblRutas = new JLabel("Rutas");
		lblRutas.setFont(new Font("Arial Black", Font.BOLD, 20));
		lblRutas.setBounds(49, 25, 79, 20);
		contentPane.add(lblRutas);
		
		JComboBox CBEventos = new JComboBox();
		CBEventos.setBounds(283, 56, 135, 20);
		contentPane.add(CBEventos);
		
		JLabel lblEventos = new JLabel("Eventos");
		lblEventos.setFont(new Font("Arial Black", Font.BOLD, 20));
		lblEventos.setBounds(283, 25, 93, 20);
		contentPane.add(lblEventos);
		
		JButton Agregar = new JButton("Add");
		Agregar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Principal.insertEventRuta();
			}
		});
		Agregar.setFont(new Font("Arial Black", Font.PLAIN, 20));
		Agregar.setBounds(49, 98, 147, 37);
		contentPane.add(Agregar);
		
		JButton Limpiar = new JButton("Clean");
		Limpiar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Principal.deleteEventRuta();
			}
		});
		Limpiar.setFont(new Font("Arial Black", Font.PLAIN, 20));
		Limpiar.setBounds(283, 98, 147, 37);
		contentPane.add(Limpiar);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(49, 166, 381, 178);
		contentPane.add(scrollPane);
		
		table = new JTable();
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null},
			},
			new String[] {
				"Ruta", "Evento", "Informe"
			}
		));
		scrollPane.setViewportView(table);

		int numCols = table.getModel().getColumnCount();

		Object [] fila = new Object[numCols]; 
		        
		 fila[0] = "unal";
		 fila[1] = "420";
		 fila[2] = "mundo";
		 
		
		ArrayList<String> listaParadas = new ArrayList<String>();
		listaParadas= Principal.viewParadas();
		for(int i=0; i<listaParadas.size();i++) {
	     	 CBRutas.addItem(listaParadas.get(i));
		}
		
		ArrayList<String> listaEventos = new ArrayList<String>();
		listaEventos= Principal.viewEventos();
		for(int i=0; i<listaEventos.size();i++) {
	     	 CBEventos.addItem(listaEventos.get(i));
		}
			
		ArrayList<String> listaEventRuta = new ArrayList<String>();
		listaEventRuta= Principal.viewEventRuta();
		
		
		for(int i=0; i<listaEventRuta.size();i++) {
			//listaEventRuta.get(i);
		}
		
	}
	
	
	public void setMotorController(MotorController motorController){
        this.motorController = motorController;
    }
}
