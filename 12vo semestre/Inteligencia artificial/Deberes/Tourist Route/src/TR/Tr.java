package TR;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import java.awt.Color;
import java.awt.SystemColor;
import javax.swing.UIManager;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import javax.swing.SpringLayout;

public class Tr extends JFrame {

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Tr frame = new Tr();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}


	public Tr() {
		getContentPane().setBackground(Color.WHITE);
		setTitle("Tourist Route - Artificial Intelligence");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 960, 540);
		SpringLayout springLayout = new SpringLayout();
		getContentPane().setLayout(springLayout);
		
		JLabel lblSistemaTuristico = new JLabel("System for recommending\r\nthe best Ecuadorian tourist route from Guayaquil to Quito");
		springLayout.putConstraint(SpringLayout.NORTH, lblSistemaTuristico, 11, SpringLayout.NORTH, getContentPane());
		springLayout.putConstraint(SpringLayout.WEST, lblSistemaTuristico, 59, SpringLayout.WEST, getContentPane());
		springLayout.putConstraint(SpringLayout.SOUTH, lblSistemaTuristico, 46, SpringLayout.NORTH, getContentPane());
		springLayout.putConstraint(SpringLayout.EAST, lblSistemaTuristico, 898, SpringLayout.WEST, getContentPane());
		lblSistemaTuristico.setFont(new Font("Arial", Font.BOLD, 20));
		lblSistemaTuristico.setBackground(new Color(0, 0, 0));
		lblSistemaTuristico.setForeground(Color.BLACK);
		getContentPane().add(lblSistemaTuristico);
		
		JButton Eventos = new JButton("Eventos");
		Eventos.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				 Evento ev = new Evento();
				 ev.setVisible(true);			 
			}
		});
		springLayout.putConstraint(SpringLayout.NORTH, Eventos, 296, SpringLayout.NORTH, getContentPane());
		springLayout.putConstraint(SpringLayout.WEST, Eventos, 250, SpringLayout.WEST, getContentPane());
		springLayout.putConstraint(SpringLayout.SOUTH, Eventos, 378, SpringLayout.NORTH, getContentPane());
		springLayout.putConstraint(SpringLayout.EAST, Eventos, 404, SpringLayout.WEST, getContentPane());
		Eventos.setFont(new Font("Arial", Font.BOLD, 20));
		getContentPane().add(Eventos);
		
		JButton btnStart = new JButton("Start");
		springLayout.putConstraint(SpringLayout.NORTH, btnStart, 296, SpringLayout.NORTH, getContentPane());
		springLayout.putConstraint(SpringLayout.WEST, btnStart, 536, SpringLayout.WEST, getContentPane());
		springLayout.putConstraint(SpringLayout.SOUTH, btnStart, 378, SpringLayout.NORTH, getContentPane());
		springLayout.putConstraint(SpringLayout.EAST, btnStart, 690, SpringLayout.WEST, getContentPane());
		btnStart.setFont(new Font("Arial Black", Font.PLAIN, 20));
		getContentPane().add(btnStart);
		
	}
}
