package com.lume.panel.portal.models.Enums;

public enum DocumentType {

    CPF(0),
    CNPJ(1);

    private int documentType;

    DocumentType(int documentType){
        this.documentType = documentType;
    }

    public int getRole(){
        return documentType;
    }
}
