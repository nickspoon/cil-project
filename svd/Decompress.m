
function I_rec = Decompress(I_comp)
    I_rec=I_comp.U*I_comp.D*I_comp.V';
    I_rec=reshape(I_rec,I_comp.s);
end