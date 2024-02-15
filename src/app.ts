import express, { NextFunction, Request, Response } from 'express';
import { routes } from './routes';
import "express-async-errors";
import { AppError } from './errors/AppError';
import cors from 'cors';
export const app = express();

app.use(express.json());
app.use(cors());
app.use(routes)


app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
    if(err instanceof AppError){
        return res.status(err.statusCode).json({
            status: "error",
            message: err.message
        })
    }
    return res.status(500).json({
        status: "error",
        message: `Erro interno no servidor - ${err.message}`
    })
});

app.post('/', (req, res) => {
    return res.status(201).send();
});
