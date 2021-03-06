#' draw conceptual diagram of process macro model
#' @param no process macro model number
#' @param labels A character list
#' @param covar A optional list of covariates
#'@param radx horizontal radius of the box.
#'@param rady vertical radius of the box.
#'@param xmargin horizontal margin of plot
#'@param box.col fill color of box
#' @param xlim the x limits (min,max) of the plot
#' @param ylim the y limits (min,max) of the plot
#' @export
#' @examples
#' pmacroModel(1)
#' covar=list(name=c("C1","C2"),label=c("ese","sex","tenure"),site=list("Y","Y"))
#' pmacroModel(1,covar=covar)
#' covar=list(name=c("C1","C2","C3"),label=c("ese","sex","tenure"),site=list("M",c("Mi","Y"),c("Y")))
#' pmacroModel(4,covar=covar)
pmacroModel=function(no=1,labels=list(),covar=list(),radx=0.06,rady=0.06,xmargin=0.03,box.col="white",
                     xlim=NULL,ylim=NULL){
    # no=76
    # labels=list("X"="age","M"="educ","Y"="interest","W"="policy","Z"="male")
    #labels=list()
    # no=58.2;labels=list();covar=list();radx=0.06;rady=0.06;xmargin=0.03
    # xlim=NULL;ylim=NULL
    # labels=list(X="age",M=c("educ","male"),Y="interest",W="policy")


    i=which(pmacro$no==no)
    i
    if(length(i)<1) {
        cat("Currently, Model number ",no," is not supported.")
    } else{
        if(no %in% c(4.2,4.3,6.0,6.3,6.4)){
            statisticalDiagram(no,labels=labels,arrowlabel = FALSE,covar=covar,radx=radx,rady=rady)
        } else{
    name=list()
    sites=list()
    moderator=list()
    if(pmacro$modName[i]!=""){
        name=unlist(strsplit(pmacro$modName[i],":"))
        name
        sites=unlist(strsplit(pmacro$modSite[i],":"))
        x=strsplit(sites,",")
        latent=rep(FALSE,length(name))
        pos=as.numeric(unlist(strsplit(pmacro$pos[i],",")))
        pos
        if(length(pos)==0) pos=3
        labels

        label=c()
        for(j in 1:length(name)){
            if(!is.null(labels[[name[j]]])) {
                label=c(label,labels[[name[j]]])
            } else {
                label=c(label,name[j])
            }
        }
        moderator=list(name=name,label=label,site=x,latent=latent,pos=pos)
        moderator

    }
    i
    M=pmacro$M[i]
    if(M=="") {
        M=c()
    } else if(str_detect(M,":")){
        M=unlist(strsplit(M,":"))
        if(!is.null(labels$M)){
            M=labels$M
        }
    }else{
        if(!is.null(labels$M)){
            M=labels$M
        }
    }
    M
    X=pmacro$X[i]
    if(!is.null(labels$X)){
        X=labels$X
    }
    Y=pmacro$Y[i]
    if(!is.null(labels$Y)){
        Y=labels$Y
    }

    if(no==74) {
        conceptDiagram2(X=X,M=M,Y=Y,xb=TRUE,covar=covar,radx=radx,rady=rady,xmargin=xmargin,
                        box.col=box.col,xlim=xlim,ylim=ylim)
    } else {
        conceptDiagram2(X=X,M=M,Y=Y,moderator = moderator,covar=covar,radx=radx,rady=rady,xmargin=xmargin,
                        box.col=box.col,xlim=xlim,ylim=ylim)
    }

        }
    }
    if(no==3){
        straightarrow(c(0.20,0.75),to=c(0.485,0.65),lwd=1,arr.pos=1,arr.type="triangle")
        label=ifelse(is.null(labels$Z),"Z",labels$Z)

        textrect(mid=c(0.20,0.75),radx=radx,rady=rady,lab=label,box.col=box.col)
    }
    if(no %in% c(11:13,25:27)){

        yinterval=rady*7
        xend=midPoint(radx+xmargin,0.5,length.out=1)
        yend=midPoint(0.4,0.4+yinterval,length.out=1)
        to=c(midPoint(radx+xmargin,xend,length.out=1)-0.02,midPoint(0.5+yinterval,yend,length.out=1))
        straightarrow(c(radx+xmargin,(0.9+yinterval)/2),to=to,lwd=1,arr.pos=1,arr.type="triangle")

        if(no %in% c(12,26)){
            xend=0.5
            yend=0.4
            to=c(midPoint(radx+xmargin,xend,length.out=1)-0.015,midPoint(0.5+yinterval,yend,length.out=1))
            straightarrow(c(radx+xmargin,(0.9+yinterval)/2),to=to,lwd=1,arr.pos=1,arr.type="triangle")

        }
        label=ifelse(is.null(labels$Z),"Z",labels$Z)

        textrect(mid=c(radx+xmargin,(0.9+yinterval)/2),radx=radx,rady=rady,lab=label,box.col=box.col)

    }
    if(no %in% 18:20){

        yinterval=rady*7
        xend=midPoint(1-(radx+xmargin),0.5,length.out=1)
        yend=midPoint(0.4,0.4+yinterval,length.out=1)
        to=c(midPoint(1-(radx+xmargin),xend,length.out=1)+0.02,midPoint(0.5+yinterval,yend,length.out=1))
        straightarrow(c(1-(radx+xmargin),(0.9+yinterval)/2),to=to,lwd=1,arr.pos=1,arr.type="triangle")

        if(no %in% 19){
            xend=0.5
            yend=0.4
            to=c(midPoint(1-(radx+xmargin),xend,length.out=1)+0.015,midPoint(0.5+yinterval,yend,length.out=1))
            straightarrow(c(1-(radx+xmargin),(0.9+yinterval)/2),to=to,lwd=1,arr.pos=1,arr.type="triangle")

        }
        label=ifelse(is.null(labels$Z),"Z",labels$Z)

        textrect(mid=c(1-(radx+xmargin),(0.9+yinterval)/2),radx=radx,rady=rady,lab=ifelse(is.null(labels$Z),"Z",labels$Z),box.col=box.col)

    }

}

