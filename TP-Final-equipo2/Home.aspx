﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TP_Final_equipo2.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            height: 80vh;
            background-image: url("https://necochea.gov.ar/wp-content/uploads/2023/05/31-05-FOTO-ILUSTRATIVA-Medicina-General.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        .welcome {
            text-align: center;
            font-size: 42px;
            color: mediumturquoise;
            width: 450px;
            margin: auto;
            font-style: italic;
            background-color: seashell;
        }

        .button-container {
            display: grid;
            grid-template-columns: repeat(1, 2fr);
            grid-gap: 10px;
            margin-top: 20px;
            font-family: cursive;
        }

            .button-container .btn {
                width: 100%;
                padding: 12px;
                font-size: 18px;
                background-color: cadetblue;
                color: ghostwhite;
                border: ridge;
                cursor: pointer;
                transition: background-color 0.5s ease-out;
            }

                .button-container .btn:hover {
                    background-color: teal;
                    border: double;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="welcome">Bienvenido al HOME...</h1>
        <asp:Label ID="msj" runat="server" Text="" Visible="false"></asp:Label>
        <div class="button-container">
            <% if (Session["usuario"] != null && (((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.Recepcion ||  ((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.Admin ))
                { %>
            <asp:Button runat="server" CssClass="btn" ID="btnnewPaciente" OnClick="btnnewPaciente_Click" Text="Administrar Pacientes" />
            
            <asp:Button runat="server" CssClass="btn" ID="btnnewMedico" OnClick="btnnewMedico_Click" Text="Administrar Médicos" />
            <% }%>
            <% if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.Admin)
                { %>
            <asp:Button runat="server" CssClass="btn" ID="btnEspecialidades" OnClick="btnEspecialidades_Click" Text="Administrar Especialidades" />
            <% }%>
            <% if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.Medico)
                { %>
            <asp:Button runat="server" CssClass="btn" ID="btnTurnosxmedicos" OnClick="btnTurnosxmedicos_Click"  Text="Turnos asignados"/>
            <hr />
            <% }%>
                <% if (Session["usuario"] != null && (((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.Recepcion ||  ((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.Admin ))
                { %>
            <asp:Button runat="server" CssClass="btn" ID="btnTurno" OnClick="btnnewTurno_Click" Text="Cargar Turno" />
            <% }%>
            <% if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.Paciente)
                { %>
            <asp:Button ID="btnMisturnos" CssClass="btn" OnClick="btnMisturnos_Click" runat="server" Text="Mis Turnos" />
            <asp:Button runat="server" CssClass="btn" ID="btnTurnoPaciente"  OnClick="btnTurnoPaciente_Click"  Text="Nuevo Turno" />
            <% }%>
        </div>
    </div>
</asp:Content>






