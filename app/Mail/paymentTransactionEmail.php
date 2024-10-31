<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class paymentTransactionEmail extends Mailable
{
    use Queueable, SerializesModels;

    protected $transaction;
    protected $invitation_status;

    /**
     * Create a new message instance.
     */
    public function __construct($transaction, $invitation_status)
    {
        $this->transaction       = $transaction;
        $this->invitation_status = $invitation_status;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Pembayaran Transaksi',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'email.V_payment_transaction_email',
            with: [
                'transaction'       => $this->transaction,
                'invitation_status' => $this->invitation_status,
            ],
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
